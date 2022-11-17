#ifndef SCRIPT_PROGRAM_H
#define SCRIPT_PROGRAM_H

#include "atl/array.h"
#include "atl/map.h"
#include "script/value.h"
#include "string/string.h"
#include "profile/rocky.h"
#include "paging/ref.h"

namespace rage {

struct script_def;
class fiStream;
class scrThread;
class scrProgram;

#define EXECUTABLE_SCRIPTS	(0 && (__PS3 || __XENON) && !__FINAL)	// make sure this functionality doesn't ship until we're sure we will use it.

#define STREAMABLE_PROGRAMS	1

#define ENABLE_SCRIPT_GLOBALS_HEAP 		RSG_ORBIS || RSG_DURANGO

const int MAX_LEGIT_OPS = (11*1024*1024);		//	Used as the size of the atFixedArray called Program in rage\script\tools\scriptcompiler\node.h

// These configure the size of each opcode page
static const u32 scrPageShift = 14;
static const u32 scrPageSize = (1 << scrPageShift);
static const u32 scrPageMask = (scrPageSize - 1);

// These configure the size of each string page.
static const u32 scrStringShift = 14;
static const u32 scrStringSize = (1 << scrStringShift);
static const u32 scrStringMask = (scrStringSize - 1);

// These configure the size of each globals page, in multiples of sizeof(scrValue).  This is used to prevent globals from requiring an absurdly large memory block just long enough to (re)load.
static const u32 scrGlobalsPageShift = 14;
static const u32 scrGlobalsPageSize = (1 << scrGlobalsPageShift);
static const u32 scrGlobalsPageMask = (scrGlobalsPageSize - 1);

class scrProgram: public pgBase {
	friend class scrThread;
	scrProgram(const char *name,u32 opcodeSize,u32 nativeSize,u32 staticSize,u32 globalSize,int globalsBlock,u32 stringHeapSize,u32 argStructSize,u32 globalsHash);
public:
	static const int RORC_VERSION = 12;

	enum { 
		MAX_GLOBAL_BLOCKS_SHIFT = (24 - 6),
		MAX_GLOBAL_BLOCKS = (64),
		GLOBAL_SIZE_MASK = ((1 << (MAX_GLOBAL_BLOCKS_SHIFT)) - 1)
	};

	scrProgram(datResource&);
	~scrProgram();
	IMPLEMENT_PLACE_INLINE(scrProgram);
#if __DECLARESTRUCT
	void DeclareStruct(datTypeStruct &s);
#endif
#if __RESOURCECOMPILER
	scrProgram(const scrProgram &that);
#endif

	void AddRef();

	int GetNumRefs() const;
	
	int Release();

	__forceinline const u8& operator[](u32 index) const {
		DEV_ONLY(TrapGE(index,OpcodeSize));
		return Table[index >> scrPageShift][index & scrPageMask];
	}

	__forceinline u8& operator[](u32 index) {
		DEV_ONLY(TrapGE(index,OpcodeSize));
		return Table[index >> scrPageShift][index & scrPageMask];
	}

	static u32 CalculateGlobalHash(const scrValue *pGlobalBuffer, u32 numberOfGlobals);

#if ENABLE_SCRIPT_GLOBALS_HEAP
	// Runtime startup of the globals Allocator
	static void InitGlobalsHeap(void* heapStart, int heapSize);

#if RSG_ASSERT
	// Verify that the Globals heap got cleaned
	static void AssertGlobalsHeapEmpty();
#endif
#endif // ENABLE_SCRIPT_GLOBALS_HEAP

	// Only used by script compiler
	static void Init(const char *name,const u8* opcodes,int opcodeSize,const u64 *nativeHashes,int nativeSize,const scrValue *statics,int staticSize,const scrValue *globals,int globalSize,int globalsBlock,const char *stringHeap,int stringHeapSize,int argStructSize);

	// PURPOSE:	Loads a program, assuming the filename and program name are identical
	static scrProgramId Load(const char *progname);

	// PURPOSE:	Loads a program, assuming the filename and program name are not identical
	static scrProgramId Load(const char *inputFileName,const char *progname);

	static bool Save(const char *progname,int globalsBlock);

	static scrProgram* GetProgram(scrProgramId progId);

	int GetOpcodeSize() const { return OpcodeSize; }

    void SetBreakpoint( int offset, bool setOrUnSet, bool stopsGame=false );

    bool HasBreakpoint( int offset, bool *stopsGame=NULL );

	//PURPOSE: Allocates memory
	void SetGlobals();
	u32 GetGlobalsHash();

	static scrValue **GetGlobalsBlocks() { return &sm_Globals[0]; }
	static scrValue *GetGlobals(int block) { return sm_Globals[block]; }
#if RSG_PC
	static u32 GetGlobalNameHash(int block) { return sm_GlobalBlockIndexToNameHash[block];}
#endif
	static int GetGlobalSize(int block) { return sm_GlobalSizes[block]; }

	const scrValue *GetStatics() const { return Statics; }

	int GetStaticSize() const { return StaticSize; }

	int GetStringHeapSize() const { return StringHeapSize; }

	// RETURNS:		Arg struct size, in VM words, not bytes.
	int GetArgStructSize() const { return ArgStructSize; }

	static void InitClass();

	static void ShutdownClass();

	const char *GetScriptName() const { return ScriptName; }

	// PURPOSE:	Default callback for getting the fully qualified path name
	static void DefaultGetFullFilename(char *dest, int maxBuf, const char *input, const char *ext);

	// PURPOSE:	Callback for getting script file names
	static void (*GetFullFilename)(char *dest, int maxBuf, const char *input, const char *ext);

	// PURPOSE: Returns current program's hash code
	scrProgramId GetProgramId() const { return (scrProgramId) HashCode; }

	// PURPOSE: Validate the program
	static bool Validate(scrProgramId progId);

	// PURPOSE: Set script programs can be deleted
#if __ASSERT
	static void AllowDelete(bool bAllow) {sm_AllowDelete = bAllow;}
#endif

	// PURPOSE: Disable check of globals signature (turns a quitf into an errorf)
	static void AllowMismatchedGlobals(bool bAllow) {sm_AllowMismatchedGlobals = bAllow;}

	u32 GetHashCode() const { return HashCode; }

	u32 GetNativeSize() const { return NativeSize; }
	const u64* GetNatives() const { return Natives; }

#if EXECUTABLE_SCRIPTS
	// PURPOSE: Determine whether a program is interpreted or compiled.
	bool IsCompiled() const { return !Table; }

	// PURPOSE: Determine whether a named script is resident as a compiled C++ module.
	static scrProgramId IsCompiledAndResident(const char *scriptName);
	static bool RegisterBinary(const char* prxPath);
#else

#if USE_PROFILER
	u32 GetProcCount() const { return ProcCount; }
	const char** GetProcNames() const { return ProcNames; }
#endif

	static scrProgramId IsCompiledAndResident(const char *) { return (scrProgramId)0; }
#endif

private:
	u8 **Table;					// +8 (zero if compiled)
	u32 GlobalsHash;			// +12
	u32 OpcodeSize;				// +16
	u32 ArgStructSize;			// +20
	u32 StaticSize;				// +24
	u32 GlobalSizeAndBlock;		// +28 - upper bits are the globals block index
	u32 NativeSize;				// +32
	scrValue *Statics;			// +36
	scrValue **GlobalsTable;	// +40 (zero if compiled, globals cannot be declared in a compiled script)
	u64 *Natives;				// +44 (if compiled, really a script function pointer)
	u32 ProcCount;				// +48 (zero if compiled)
	const char **ProcNames;		// +52 (zero if compiled)
	u32 HashCode;				// +56
	u32 RefCount;	// +60
	ConstString ScriptName;		// +64
	const char **StringHeaps;	// +68 (zero if compiled)
	u32 StringHeapSize;			// +72 (zero if compiled)
	atMap<s32,bool> *m_programBreakpoints; // +76 (zero if compiled)

	u32 GetStringHeapCount() const { return (StringHeapSize + scrStringMask) >> scrStringShift; }
	u32 GetStringHeapChunkSize(u32 i) { return i==GetStringHeapCount()-1? StringHeapSize - (i << scrStringShift) : scrStringSize; }
	u32 GetGlobalsPageCount() const { return ((GlobalSizeAndBlock & GLOBAL_SIZE_MASK) + scrGlobalsPageMask) >> scrGlobalsPageShift; }
	u32 GetGlobalsPageChunkSize(u32 i) { return i==GetGlobalsPageCount()-1? (GlobalSizeAndBlock & GLOBAL_SIZE_MASK) - (i << scrGlobalsPageShift) : scrGlobalsPageSize; }

#if EXECUTABLE_SCRIPTS
	scrProgram(const script_def &);
#endif
#if RSG_PC
	static atMap<u32, u32> sm_GlobalBlockIndexToNameHash;
#endif
	static atRangeArray<scrValue *,MAX_GLOBAL_BLOCKS> sm_Globals;
	static atRangeArray<int,MAX_GLOBAL_BLOCKS> sm_GlobalSizes;
	static bool sm_AllowMismatchedGlobals;
#if __ASSERT
	static bool sm_AllowDelete;
#endif
};

}	// namespace rage

#endif
