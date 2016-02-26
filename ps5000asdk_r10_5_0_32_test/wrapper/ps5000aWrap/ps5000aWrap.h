/****************************************************************************
 *
 * Filename:    ps5000aWrap.h
 * Copyright:   Pico Technology Limited 2013
 * Author:      HSM
 * Description:
 *
 * This header defines the interface to the wrapper dll for the 
 *	PicoScope5000a series of PC Oscilloscopes.
 *
 ****************************************************************************/
#ifndef __PS5000AWRAP_H__
#define __PS5000AWRAP_H__

#include "ps5000aApi.h"

extern PICO_STATUS __declspec(dllexport) __stdcall RunBlock
(
	int16_t handle, 
	int32_t preTriggerSamples, 
	int32_t postTriggerSamples, 
	uint32_t timebase,
	uint32_t segmentIndex
);

extern PICO_STATUS __declspec(dllexport) __stdcall GetStreamingLatestValues
(
	int16_t handle
);

extern uint32_t __declspec(dllexport) __stdcall AvailableData
(
	int16_t handle, 
	uint32_t *startIndex
);

extern int16_t __declspec(dllexport) __stdcall AutoStopped
(
	int16_t handle
);

extern int16_t __declspec(dllexport) __stdcall IsReady
(
	int16_t handle
);

extern int16_t __declspec(dllexport) __stdcall IsTriggerReady
(
	int16_t handle, 
	uint32_t *triggeredAt
);

extern int16_t __declspec(dllexport) __stdcall ClearTriggerReady
(
	int16_t handle
);

extern PICO_STATUS __declspec(dllexport) __stdcall SetTriggerConditions
(
	int16_t handle, 
	int32_t *conditionsArray, 
	int16_t nConditions
);

extern PICO_STATUS __declspec(dllexport) __stdcall SetTriggerProperties
(
	int16_t handle, 
	int32_t *propertiesArray, 
	int16_t nProperties,  
	int32_t autoTrig
);

extern PICO_STATUS __declspec(dllexport) __stdcall SetPulseWidthQualifier
(
	int16_t handle,
	int32_t *pwqConditionsArray,
	int16_t nConditions,
	int32_t direction,
	uint32_t lower,
	uint32_t upper,
	int32_t type
);

extern void __declspec(dllexport) __stdcall setChannelCount
(
	int16_t handle, 
	int16_t channelCount
);

extern int16_t __declspec(dllexport) __stdcall setEnabledChannels
(
	int16_t handle, 
	int16_t * enabledChannels
);

extern int16_t __declspec(dllexport) __stdcall setAppAndDriverBuffers
(
	int16_t handle, 
	int16_t channel, 
	int16_t * appBuffer, 
	int16_t * driverBuffer,
	uint32_t bufferLength
);

extern int16_t __declspec(dllexport) __stdcall setMaxMinAppAndDriverBuffers
(
	int16_t handle, 
	int16_t channel, 
	int16_t * appMaxBuffer,
	int16_t * appMinBuffer, 
	int16_t * driverMaxBuffer, 
	int16_t * driverMinBuffer,
	uint32_t bufferLength
);

#endif
