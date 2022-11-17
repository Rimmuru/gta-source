void CNetGamePlayer::Shutdown()
{
	m_PlayerHasJustDied					= false;
	m_MatchmakingGroup					= MM_GROUP_INVALID;
    m_bIsSpectator						= false;
    m_nCrewId							= RL_INVALID_CLAN_ID;
	m_bIsLocallyDisconnected			= false;
	m_bHasSentTimeoutScriptEvent		= false;
	m_bWasDisconnectedDuringTransition	= false;
	m_bIsLaunchingTransition			= false;
	m_bGamerDataDirtyPending			= false;
	m_nPropertyID						= NO_PROPERTY_ID;
	m_nMentalState						= NO_MENTAL_STATE;
	WIN32PC_ONLY(m_fPedDensity						= 0;)
    m_GarageInstanceIndex				= INVALID_GARAGE_INDEX;
    m_bHasVoiceProximityOverride		= false;
    m_vVoiceProximityOverride			= Vector3(VEC3_ZERO);
	m_bOverrideSpectatedVehicleRadio	= false;
	m_IsInDifferentTutorialSession		= false;
	m_bIsRockstarDev					= false;
	m_bIsRockstarQA						= false;
	m_bIsCheater						= false;
	m_VehicleWithPhoneExplosive			= NETWORK_INVALID_OBJECT_ID;
	m_PlayerFlags						= 0;
		
	if (m_PlayerInfo)
	{
		if (IsMyPlayer())
		{
			m_PlayerInfo->MultiplayerReset();
		}
		else
		{
			if(GetPlayerPed() && (m_PlayerInfo == GetPlayerPed()->GetPlayerInfo()))
			{
				//! gnetVerify that player info has been removed. If not, we must do it now or we'll leave it dangling.
				if(!gnetVerifyf(!GetPlayerPed()->GetPlayerInfo(), "CNetGamePlayer::Shutdown() - Deleting player info pointer (%p) when it is still referenced by %s", m_PlayerInfo, GetPlayerPed()->GetDebugName()))
				{
					CControlledByInfo currentControlInfo = GetPlayerPed()->GetControlledByInfo();
					const CControlledByInfo newControlInfo(currentControlInfo.IsControlledByNetwork(), false);
					GetPlayerPed()->SetControlledByInfo(newControlInfo);
					GetPlayerPed()->SetPlayerInfo(NULL);
				}
			}
			
			//safety net - we MUST unref player info ptr from any peds that point to it.
			{
				// ensure no other peds are using this player info
				CPed::Pool *pedPool = CPed::GetPool();

				for(int index = 0; index < pedPool->GetSize(); index++)
				{
					CPed *pPed = pedPool->GetSlot(index);

					if(pPed && pPed->GetPlayerInfo() == m_PlayerInfo)
					{
						gnetAssertf(0, "CNetGamePlayer::Shutdown() - Safety Net. Deleting a player info pointer (%p) when it is still referenced by %s", m_PlayerInfo, pPed->GetDebugName());
						CControlledByInfo currentControlInfo = pPed->GetControlledByInfo();
						const CControlledByInfo newControlInfo(currentControlInfo.IsControlledByNetwork(), false);
						pPed->SetControlledByInfo(newControlInfo);

						pPed->SetPlayerInfo(NULL);
					}
				}
			}

			delete m_PlayerInfo;	
		}
	}

    m_PlayerInfo = 0;
    m_RoamingBubbleMemberInfo.Invalidate();

    m_nCharacterRank = 0;
	
	//Set the clan info to a cleared clan desc to clear it out correctly.
	rlClanMembershipData blankMemInfo; blankMemInfo.Clear();
	SetClanMembershipInfo(blankMemInfo);

	m_bHasStartedTransition = false;
	m_TransitionSessionInfo.Clear();

	m_MuteBeenMutedCount = 0;
	m_MuteTalkersMetCount = 0;

	m_cheatsNotified.Reset();

	m_hasCommunicationPrivileges = false;

    netPlayer::Shutdown();

	m_cheatsTamperCodes.Reset();

	m_bShouldAllocateBubble = true;
}