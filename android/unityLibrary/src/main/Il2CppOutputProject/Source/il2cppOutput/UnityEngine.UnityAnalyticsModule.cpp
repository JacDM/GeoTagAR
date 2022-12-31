#include "pch-cpp.hpp"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif


#include <limits>
#include <stdint.h>


template <typename R>
struct VirtualFuncInvoker0
{
	typedef R (*Func)(void*, const RuntimeMethod*);

	static inline R Invoke (Il2CppMethodSlot slot, RuntimeObject* obj)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		return ((Func)invokeData.methodPtr)(obj, invokeData.method);
	}
};

struct Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C;
struct Action_1_t923A20D1D4F6B55B2ED5AE21B90F1A0CE0450D99;
struct Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB;
struct Action_3_t838D6B6BB4BFFC6E8430C389747DB008A0B26146;
struct DelegateU5BU5D_tC5AB7E8F745616680F337909D3A8E6C722CDF771;
struct IntPtrU5BU5D_tFD177F8C806A6921AD7150264CCC62FA00CAD832;
struct StackTraceU5BU5D_t32FBCB20930EAF5BAE3F450FF75228E5450DA0DF;
struct Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07;
struct ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263;
struct Assembly_t;
struct Delegate_t;
struct DelegateData_t9B286B493293CD2D23A5B2B5EF0E5B1324C2B77E;
struct IDictionary_t6D03155AF1FA9083817AA5B6AD7DEEACC26AB220;
struct MethodInfo_t;
struct RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52;
struct SafeSerializationManager_tCBB85B95DFD1634237140CD892E82D06ECB3F5E6;
struct String_t;
struct Void_t4861ACF8F4594C3437BB48B6E56783494B843915;
struct IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395;
struct SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C;
struct UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4;

IL2CPP_EXTERN_C Il2CppSequencePoint g_sequencePointsUnityEngine_UnityAnalyticsModule[];
IL2CPP_EXTERN_C RuntimeClass* Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* String_t_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C String_t* _stringLiteral2276B6A66302EB28763BDF59157B4221777ADB5A;
IL2CPP_EXTERN_C String_t* _stringLiteralECCC4B7A0DA4E8DB493886ED11AC56BA55FBE86F;
IL2CPP_EXTERN_C const RuntimeMethod* AnalyticsSessionInfo_CallIdentityTokenChanged_m1AD21A1840BCB9CB222455F609DBBF7B7B380911_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* AnalyticsSessionInfo_CallSessionStateChanged_m6C3C7DD13064E37D7C3AE9411355BCEF77C4664B_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* Analytics_RegisterEvent_m82BE2F186E2F452E6FFE10DC44207C3438E660E4_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* Analytics_RegisterEvent_mC82148D11A02968E347F9D11237D50826223A7C3_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* Analytics_SendEvent_m9E942728E301EA9E90741ADD1ED71DAD118819B5_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* RemoteConfigSettings_RemoteConfigSettingsUpdated_mA71E7C6CDAF5D349BF0B4880A4D54DF2365EB948_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* RemoteSettings_RemoteSettingsBeforeFetchFromServer_m677DED4CFA8C9E498227A3E939242974DF8FA35C_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* RemoteSettings_RemoteSettingsUpdateCompleted_m56713308E00B18BF0E5FADEC93D67A70F7E5FD86_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* RemoteSettings_RemoteSettingsUpdated_m6202CCC0AF33D44838BB46977D075E54FD5EC069_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeType* Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* AnalyticsResult_tD3F23442DE6D00D9F160F7C9D3C7E3C5DEB91DCE_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* String_t_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4_0_0_0_var;
struct Delegate_t_marshaled_com;
struct Delegate_t_marshaled_pinvoke;
struct Exception_t_marshaled_com;
struct Exception_t_marshaled_pinvoke;

struct DelegateU5BU5D_tC5AB7E8F745616680F337909D3A8E6C722CDF771;

IL2CPP_EXTERN_C_BEGIN
IL2CPP_EXTERN_C_END

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

struct U3CModuleU3E_t6B4A7D64487421A1C7A9ACB5578F8A35510E2A0C 
{
};

struct Analytics_tF5AF7B75C971CF64A542B88268F097E1B65573B0  : public RuntimeObject
{
};

struct AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76  : public RuntimeObject
{
};

struct AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76_StaticFields
{
	SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* ___sessionStateChanged_0;
	IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* ___identityTokenChanged_1;
};
struct Il2CppArrayBounds;

struct Assembly_t  : public RuntimeObject
{
};
struct Assembly_t_marshaled_pinvoke
{
};
struct Assembly_t_marshaled_com
{
};

struct ContinuousEvent_t71122F6F65BF7EA8490EA664A55D5C03790CB6CF  : public RuntimeObject
{
};

struct RemoteConfigSettingsHelper_t29B2673892F8181388B45FFEEE354B3773629588  : public RuntimeObject
{
};

struct RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250  : public RuntimeObject
{
};

struct RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_StaticFields
{
	UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* ___Updated_0;
	Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07* ___BeforeFetchFromServer_1;
	Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB* ___Completed_2;
};

struct String_t  : public RuntimeObject
{
	int32_t ____stringLength_4;
	Il2CppChar ____firstChar_5;
};

struct String_t_StaticFields
{
	String_t* ___Empty_6;
};

struct ValueType_t6D9B272BD21782F0A9A14F2E41F85A50E97A986F  : public RuntimeObject
{
};
struct ValueType_t6D9B272BD21782F0A9A14F2E41F85A50E97A986F_marshaled_pinvoke
{
};
struct ValueType_t6D9B272BD21782F0A9A14F2E41F85A50E97A986F_marshaled_com
{
};

struct Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22 
{
	bool ___m_value_0;
};

struct Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_StaticFields
{
	String_t* ___TrueString_5;
	String_t* ___FalseString_6;
};

struct Int32_t680FF22E76F6EFAD4375103CBBFFA0421349384C 
{
	int32_t ___m_value_0;
};

struct Int64_t092CFB123BE63C28ACDAF65C68F21A526050DBA3 
{
	int64_t ___m_value_0;
};

struct IntPtr_t 
{
	void* ___m_value_0;
};

struct IntPtr_t_StaticFields
{
	intptr_t ___Zero_1;
};

struct Void_t4861ACF8F4594C3437BB48B6E56783494B843915 
{
	union
	{
		struct
		{
		};
		uint8_t Void_t4861ACF8F4594C3437BB48B6E56783494B843915__padding[1];
	};
};

struct Delegate_t  : public RuntimeObject
{
	Il2CppMethodPointer ___method_ptr_0;
	intptr_t ___invoke_impl_1;
	RuntimeObject* ___m_target_2;
	intptr_t ___method_3;
	intptr_t ___delegate_trampoline_4;
	intptr_t ___extra_arg_5;
	intptr_t ___method_code_6;
	intptr_t ___interp_method_7;
	intptr_t ___interp_invoke_impl_8;
	MethodInfo_t* ___method_info_9;
	MethodInfo_t* ___original_method_info_10;
	DelegateData_t9B286B493293CD2D23A5B2B5EF0E5B1324C2B77E* ___data_11;
	bool ___method_is_virtual_12;
};
struct Delegate_t_marshaled_pinvoke
{
	intptr_t ___method_ptr_0;
	intptr_t ___invoke_impl_1;
	Il2CppIUnknown* ___m_target_2;
	intptr_t ___method_3;
	intptr_t ___delegate_trampoline_4;
	intptr_t ___extra_arg_5;
	intptr_t ___method_code_6;
	intptr_t ___interp_method_7;
	intptr_t ___interp_invoke_impl_8;
	MethodInfo_t* ___method_info_9;
	MethodInfo_t* ___original_method_info_10;
	DelegateData_t9B286B493293CD2D23A5B2B5EF0E5B1324C2B77E* ___data_11;
	int32_t ___method_is_virtual_12;
};
struct Delegate_t_marshaled_com
{
	intptr_t ___method_ptr_0;
	intptr_t ___invoke_impl_1;
	Il2CppIUnknown* ___m_target_2;
	intptr_t ___method_3;
	intptr_t ___delegate_trampoline_4;
	intptr_t ___extra_arg_5;
	intptr_t ___method_code_6;
	intptr_t ___interp_method_7;
	intptr_t ___interp_invoke_impl_8;
	MethodInfo_t* ___method_info_9;
	MethodInfo_t* ___original_method_info_10;
	DelegateData_t9B286B493293CD2D23A5B2B5EF0E5B1324C2B77E* ___data_11;
	int32_t ___method_is_virtual_12;
};

struct Exception_t  : public RuntimeObject
{
	String_t* ____className_1;
	String_t* ____message_2;
	RuntimeObject* ____data_3;
	Exception_t* ____innerException_4;
	String_t* ____helpURL_5;
	RuntimeObject* ____stackTrace_6;
	String_t* ____stackTraceString_7;
	String_t* ____remoteStackTraceString_8;
	int32_t ____remoteStackIndex_9;
	RuntimeObject* ____dynamicMethods_10;
	int32_t ____HResult_11;
	String_t* ____source_12;
	SafeSerializationManager_tCBB85B95DFD1634237140CD892E82D06ECB3F5E6* ____safeSerializationManager_13;
	StackTraceU5BU5D_t32FBCB20930EAF5BAE3F450FF75228E5450DA0DF* ___captured_traces_14;
	IntPtrU5BU5D_tFD177F8C806A6921AD7150264CCC62FA00CAD832* ___native_trace_ips_15;
	int32_t ___caught_in_unmanaged_16;
};

struct Exception_t_StaticFields
{
	RuntimeObject* ___s_EDILock_0;
};
struct Exception_t_marshaled_pinvoke
{
	char* ____className_1;
	char* ____message_2;
	RuntimeObject* ____data_3;
	Exception_t_marshaled_pinvoke* ____innerException_4;
	char* ____helpURL_5;
	Il2CppIUnknown* ____stackTrace_6;
	char* ____stackTraceString_7;
	char* ____remoteStackTraceString_8;
	int32_t ____remoteStackIndex_9;
	Il2CppIUnknown* ____dynamicMethods_10;
	int32_t ____HResult_11;
	char* ____source_12;
	SafeSerializationManager_tCBB85B95DFD1634237140CD892E82D06ECB3F5E6* ____safeSerializationManager_13;
	StackTraceU5BU5D_t32FBCB20930EAF5BAE3F450FF75228E5450DA0DF* ___captured_traces_14;
	Il2CppSafeArray* ___native_trace_ips_15;
	int32_t ___caught_in_unmanaged_16;
};
struct Exception_t_marshaled_com
{
	Il2CppChar* ____className_1;
	Il2CppChar* ____message_2;
	RuntimeObject* ____data_3;
	Exception_t_marshaled_com* ____innerException_4;
	Il2CppChar* ____helpURL_5;
	Il2CppIUnknown* ____stackTrace_6;
	Il2CppChar* ____stackTraceString_7;
	Il2CppChar* ____remoteStackTraceString_8;
	int32_t ____remoteStackIndex_9;
	Il2CppIUnknown* ____dynamicMethods_10;
	int32_t ____HResult_11;
	Il2CppChar* ____source_12;
	SafeSerializationManager_tCBB85B95DFD1634237140CD892E82D06ECB3F5E6* ____safeSerializationManager_13;
	StackTraceU5BU5D_t32FBCB20930EAF5BAE3F450FF75228E5450DA0DF* ___captured_traces_14;
	Il2CppSafeArray* ___native_trace_ips_15;
	int32_t ___caught_in_unmanaged_16;
};

struct RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52  : public RuntimeObject
{
	intptr_t ___m_Ptr_0;
	Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C* ___Updated_1;
};
struct RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshaled_pinvoke
{
	intptr_t ___m_Ptr_0;
	Il2CppMethodPointer ___Updated_1;
};
struct RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshaled_com
{
	intptr_t ___m_Ptr_0;
	Il2CppMethodPointer ___Updated_1;
};

struct MulticastDelegate_t  : public Delegate_t
{
	DelegateU5BU5D_tC5AB7E8F745616680F337909D3A8E6C722CDF771* ___delegates_13;
};
struct MulticastDelegate_t_marshaled_pinvoke : public Delegate_t_marshaled_pinvoke
{
	Delegate_t_marshaled_pinvoke** ___delegates_13;
};
struct MulticastDelegate_t_marshaled_com : public Delegate_t_marshaled_com
{
	Delegate_t_marshaled_com** ___delegates_13;
};

struct SystemException_tCC48D868298F4C0705279823E34B00F4FBDB7295  : public Exception_t
{
};

struct Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C  : public MulticastDelegate_t
{
};

struct Action_1_t923A20D1D4F6B55B2ED5AE21B90F1A0CE0450D99  : public MulticastDelegate_t
{
};

struct Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB  : public MulticastDelegate_t
{
};

struct Action_3_t838D6B6BB4BFFC6E8430C389747DB008A0B26146  : public MulticastDelegate_t
{
};

struct Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07  : public MulticastDelegate_t
{
};

struct ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263  : public SystemException_tCC48D868298F4C0705279823E34B00F4FBDB7295
{
	String_t* ____paramName_18;
};

struct IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395  : public MulticastDelegate_t
{
};

struct SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C  : public MulticastDelegate_t
{
};

struct UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4  : public MulticastDelegate_t
{
};
#ifdef __clang__
#pragma clang diagnostic pop
#endif
struct DelegateU5BU5D_tC5AB7E8F745616680F337909D3A8E6C722CDF771  : public RuntimeArray
{
	ALIGN_FIELD (8) Delegate_t* m_Items[1];

	inline Delegate_t* GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline Delegate_t** GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, Delegate_t* value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
		Il2CppCodeGenWriteBarrier((void**)m_Items + index, (void*)value);
	}
	inline Delegate_t* GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline Delegate_t** GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, Delegate_t* value)
	{
		m_Items[index] = value;
		Il2CppCodeGenWriteBarrier((void**)m_Items + index, (void*)value);
	}
};


IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void Action_3_Invoke_m20DB96A6E4363A11EE736FB20842C52E012CA3D6_gshared_inline (Action_3_t838D6B6BB4BFFC6E8430C389747DB008A0B26146* __this, Il2CppFullySharedGenericAny ___arg10, Il2CppFullySharedGenericAny ___arg21, Il2CppFullySharedGenericAny ___arg32, const RuntimeMethod* method) ;
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void Action_1_Invoke_m5A038831CEB84A7E374FE59D43444412629F833F_gshared_inline (Action_1_t923A20D1D4F6B55B2ED5AE21B90F1A0CE0450D99* __this, Il2CppFullySharedGenericAny ___obj0, const RuntimeMethod* method) ;

IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50_inline (UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* __this, const RuntimeMethod* method) ;
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void Action_Invoke_m7126A54DACA72B845424072887B5F3A51FC3808E_inline (Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07* __this, const RuntimeMethod* method) ;
inline void Action_3_Invoke_mB1AE88F5C5FE161C85EA4A58D5CC535721E01B21_inline (Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB* __this, bool ___arg10, bool ___arg21, int32_t ___arg32, const RuntimeMethod* method)
{
	((  void (*) (Action_3_t838D6B6BB4BFFC6E8430C389747DB008A0B26146*, Il2CppFullySharedGenericAny, Il2CppFullySharedGenericAny, Il2CppFullySharedGenericAny, const RuntimeMethod*))Action_3_Invoke_m20DB96A6E4363A11EE736FB20842C52E012CA3D6_gshared_inline)((Action_3_t838D6B6BB4BFFC6E8430C389747DB008A0B26146*)__this, (Il2CppFullySharedGenericAny)&___arg10, (Il2CppFullySharedGenericAny)&___arg21, (Il2CppFullySharedGenericAny)&___arg32, method);
}
inline void Action_1_Invoke_m69C8773D6967F3B224777183E24EA621CE056F8F_inline (Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C* __this, bool ___obj0, const RuntimeMethod* method)
{
	((  void (*) (Action_1_t923A20D1D4F6B55B2ED5AE21B90F1A0CE0450D99*, Il2CppFullySharedGenericAny, const RuntimeMethod*))Action_1_Invoke_m5A038831CEB84A7E374FE59D43444412629F833F_gshared_inline)((Action_1_t923A20D1D4F6B55B2ED5AE21B90F1A0CE0450D99*)__this, (Il2CppFullySharedGenericAny)&___obj0, method);
}
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5_inline (SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* __this, int32_t ___sessionState0, int64_t ___sessionId1, int64_t ___sessionElapsedTime2, bool ___sessionChanged3, const RuntimeMethod* method) ;
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_inline (IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* __this, String_t* ___token0, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Assembly_t* Assembly_GetCallingAssembly_mDA96275EB27A0792D97CF9E45FB7919F39A3F97E (const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t Analytics_RegisterEvent_m82BE2F186E2F452E6FFE10DC44207C3438E660E4 (String_t* ___eventName0, int32_t ___maxEventPerHour1, int32_t ___maxItems2, String_t* ___vendorKey3, int32_t ___ver4, String_t* ___prefix5, String_t* ___assemblyInfo6, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool String_IsNullOrEmpty_mEA9E3FB005AC28FE02E69FCF95A7B8456192B478 (String_t* ___value0, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void ArgumentException__ctor_m026938A67AF9D36BB7ED27F80425D7194B514465 (ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263* __this, String_t* ___message0, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool Analytics_IsInitialized_mBC7670704DE959791C8DF859A7C66D5DD5168F12 (const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t Analytics_RegisterEventWithLimit_m1C2E9701EE73122C7788186C9EA9A3C23CF51252 (String_t* ___eventName0, int32_t ___maxEventPerHour1, int32_t ___maxItems2, String_t* ___vendorKey3, int32_t ___ver4, String_t* ___prefix5, String_t* ___assemblyInfo6, bool ___notifyServer7, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t Analytics_SendEventWithLimit_m084C487537F41F55CA161ED14838A6B892421956 (String_t* ___eventName0, RuntimeObject* ___parameters1, int32_t ___ver2, String_t* ___prefix3, const RuntimeMethod* method) ;
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void RemoteSettings_RemoteSettingsUpdated_m6202CCC0AF33D44838BB46977D075E54FD5EC069 (bool ___wasLastUpdatedFromServer0, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&RemoteSettings_RemoteSettingsUpdated_m6202CCC0AF33D44838BB46977D075E54FD5EC069_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_il2cpp_TypeInfo_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* V_0 = NULL;
	bool V_1 = false;
	DECLARE_METHOD_PARAMS(methodExecutionContextParameters, (&___wasLastUpdatedFromServer0));
	DECLARE_METHOD_LOCALS(methodExecutionContextLocals, (&V_0));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, RemoteSettings_RemoteSettingsUpdated_m6202CCC0AF33D44838BB46977D075E54FD5EC069_RuntimeMethod_var, NULL, methodExecutionContextParameters, methodExecutionContextLocals);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 0));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 1));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 2));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 3));
		UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* L_0 = ((RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_StaticFields*)il2cpp_codegen_static_fields_for(RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_il2cpp_TypeInfo_var))->___Updated_0;
		V_0 = L_0;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 4));
		UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* L_1 = V_0;
		V_1 = (bool)((!(((RuntimeObject*)(UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4*)L_1) <= ((RuntimeObject*)(RuntimeObject*)NULL)))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 5));
		bool L_2 = V_1;
		if (!L_2)
		{
			goto IL_0016;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 6));
		UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* L_3 = V_0;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 7));
		NullCheck(L_3);
		UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50_inline(L_3, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 7));
	}

IL_0016:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 8));
		return;
	}
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void RemoteSettings_RemoteSettingsBeforeFetchFromServer_m677DED4CFA8C9E498227A3E939242974DF8FA35C (const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&RemoteSettings_RemoteSettingsBeforeFetchFromServer_m677DED4CFA8C9E498227A3E939242974DF8FA35C_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07* V_0 = NULL;
	bool V_1 = false;
	DECLARE_METHOD_LOCALS(methodExecutionContextLocals, (&V_0));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, RemoteSettings_RemoteSettingsBeforeFetchFromServer_m677DED4CFA8C9E498227A3E939242974DF8FA35C_RuntimeMethod_var, NULL, NULL, methodExecutionContextLocals);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 9));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 10));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 11));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 12));
		Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07* L_0 = ((RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_StaticFields*)il2cpp_codegen_static_fields_for(RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_il2cpp_TypeInfo_var))->___BeforeFetchFromServer_1;
		V_0 = L_0;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 13));
		Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07* L_1 = V_0;
		V_1 = (bool)((!(((RuntimeObject*)(Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07*)L_1) <= ((RuntimeObject*)(RuntimeObject*)NULL)))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 14));
		bool L_2 = V_1;
		if (!L_2)
		{
			goto IL_0016;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 15));
		Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07* L_3 = V_0;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 16));
		NullCheck(L_3);
		Action_Invoke_m7126A54DACA72B845424072887B5F3A51FC3808E_inline(L_3, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 16));
	}

IL_0016:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 17));
		return;
	}
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void RemoteSettings_RemoteSettingsUpdateCompleted_m56713308E00B18BF0E5FADEC93D67A70F7E5FD86 (bool ___wasLastUpdatedFromServer0, bool ___settingsChanged1, int32_t ___response2, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&RemoteSettings_RemoteSettingsUpdateCompleted_m56713308E00B18BF0E5FADEC93D67A70F7E5FD86_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB* V_0 = NULL;
	bool V_1 = false;
	DECLARE_METHOD_PARAMS(methodExecutionContextParameters, (&___wasLastUpdatedFromServer0), (&___settingsChanged1), (&___response2));
	DECLARE_METHOD_LOCALS(methodExecutionContextLocals, (&V_0));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, RemoteSettings_RemoteSettingsUpdateCompleted_m56713308E00B18BF0E5FADEC93D67A70F7E5FD86_RuntimeMethod_var, NULL, methodExecutionContextParameters, methodExecutionContextLocals);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 18));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 19));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 20));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 21));
		Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB* L_0 = ((RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_StaticFields*)il2cpp_codegen_static_fields_for(RemoteSettings_t9DFFC747AB3E7A39DF4527F245B529A407427250_il2cpp_TypeInfo_var))->___Completed_2;
		V_0 = L_0;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 22));
		Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB* L_1 = V_0;
		V_1 = (bool)((!(((RuntimeObject*)(Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB*)L_1) <= ((RuntimeObject*)(RuntimeObject*)NULL)))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 23));
		bool L_2 = V_1;
		if (!L_2)
		{
			goto IL_0019;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 24));
		Action_3_t4730167C8E7EB19F1E0034580790A915D549F6CB* L_3 = V_0;
		bool L_4 = ___wasLastUpdatedFromServer0;
		bool L_5 = ___settingsChanged1;
		int32_t L_6 = ___response2;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 25));
		NullCheck(L_3);
		Action_3_Invoke_mB1AE88F5C5FE161C85EA4A58D5CC535721E01B21_inline(L_3, L_4, L_5, L_6, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 25));
	}

IL_0019:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 26));
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
void UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50_Multicast(UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* __this, const RuntimeMethod* method)
{
	il2cpp_array_size_t length = __this->___delegates_13->max_length;
	Delegate_t** delegatesToInvoke = reinterpret_cast<Delegate_t**>(__this->___delegates_13->GetAddressAtUnchecked(0));
	for (il2cpp_array_size_t i = 0; i < length; i++)
	{
		UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* currentDelegate = reinterpret_cast<UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4*>(delegatesToInvoke[i]);
		typedef void (*FunctionPointerType) (RuntimeObject*, const RuntimeMethod*);
		((FunctionPointerType)currentDelegate->___invoke_impl_1)((Il2CppObject*)currentDelegate->___method_code_6, reinterpret_cast<RuntimeMethod*>(currentDelegate->___method_3));
	}
}
void UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50_OpenInst(UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* __this, const RuntimeMethod* method)
{
	typedef void (*FunctionPointerType) (const RuntimeMethod*);
	((FunctionPointerType)__this->___method_ptr_0)(method);
}
void UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50_OpenStatic(UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* __this, const RuntimeMethod* method)
{
	typedef void (*FunctionPointerType) (const RuntimeMethod*);
	((FunctionPointerType)__this->___method_ptr_0)(method);
}
IL2CPP_EXTERN_C  void DelegatePInvokeWrapper_UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4 (UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* __this, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc)();
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(il2cpp_codegen_get_reverse_pinvoke_function_ptr(__this));
	il2cppPInvokeFunc();

}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void UpdatedEventHandler__ctor_mB914409481F8FDC738B4EDB1DBB4883F743F863A (UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* __this, RuntimeObject* ___object0, intptr_t ___method1, const RuntimeMethod* method) 
{
	__this->___method_ptr_0 = il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1);
	__this->___method_3 = ___method1;
	__this->___m_target_2 = ___object0;
	Il2CppCodeGenWriteBarrier((void**)(&__this->___m_target_2), (void*)___object0);
	int parameterCount = il2cpp_codegen_method_parameter_count((RuntimeMethod*)___method1);
	__this->___method_code_6 = (intptr_t)__this;
	if (MethodIsStatic((RuntimeMethod*)___method1))
	{
		bool isOpen = parameterCount == 0;
		if (isOpen)
			__this->___invoke_impl_1 = (intptr_t)&UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50_OpenStatic;
		else
			{
				__this->___invoke_impl_1 = (intptr_t)__this->___method_ptr_0;
				__this->___method_code_6 = (intptr_t)__this->___m_target_2;
			}
	}
	else
	{
		if (___object0 == NULL)
			il2cpp_codegen_raise_exception(il2cpp_codegen_get_argument_exception(NULL, "Delegate to an instance method cannot have null 'this'."), NULL);
		__this->___invoke_impl_1 = (intptr_t)__this->___method_ptr_0;
		__this->___method_code_6 = (intptr_t)__this->___m_target_2;
	}
	__this->___extra_arg_5 = (intptr_t)&UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50_Multicast;
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50 (UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* __this, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
IL2CPP_EXTERN_C void RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshal_pinvoke(const RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52& unmarshaled, RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshaled_pinvoke& marshaled)
{
	marshaled.___m_Ptr_0 = unmarshaled.___m_Ptr_0;
	marshaled.___Updated_1 = il2cpp_codegen_marshal_delegate(reinterpret_cast<MulticastDelegate_t*>(unmarshaled.___Updated_1));
}
IL2CPP_EXTERN_C void RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshal_pinvoke_back(const RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshaled_pinvoke& marshaled, RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52& unmarshaled)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	intptr_t unmarshaledm_Ptr_temp_0;
	memset((&unmarshaledm_Ptr_temp_0), 0, sizeof(unmarshaledm_Ptr_temp_0));
	unmarshaledm_Ptr_temp_0 = marshaled.___m_Ptr_0;
	unmarshaled.___m_Ptr_0 = unmarshaledm_Ptr_temp_0;
	unmarshaled.___Updated_1 = il2cpp_codegen_marshal_function_ptr_to_delegate<Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C>(marshaled.___Updated_1, Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_il2cpp_TypeInfo_var);
	Il2CppCodeGenWriteBarrier((void**)(&unmarshaled.___Updated_1), (void*)il2cpp_codegen_marshal_function_ptr_to_delegate<Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C>(marshaled.___Updated_1, Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_il2cpp_TypeInfo_var));
}
IL2CPP_EXTERN_C void RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshal_pinvoke_cleanup(RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshaled_pinvoke& marshaled)
{
}
IL2CPP_EXTERN_C void RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshal_com(const RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52& unmarshaled, RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshaled_com& marshaled)
{
	marshaled.___m_Ptr_0 = unmarshaled.___m_Ptr_0;
	marshaled.___Updated_1 = il2cpp_codegen_marshal_delegate(reinterpret_cast<MulticastDelegate_t*>(unmarshaled.___Updated_1));
}
IL2CPP_EXTERN_C void RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshal_com_back(const RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshaled_com& marshaled, RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52& unmarshaled)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	intptr_t unmarshaledm_Ptr_temp_0;
	memset((&unmarshaledm_Ptr_temp_0), 0, sizeof(unmarshaledm_Ptr_temp_0));
	unmarshaledm_Ptr_temp_0 = marshaled.___m_Ptr_0;
	unmarshaled.___m_Ptr_0 = unmarshaledm_Ptr_temp_0;
	unmarshaled.___Updated_1 = il2cpp_codegen_marshal_function_ptr_to_delegate<Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C>(marshaled.___Updated_1, Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_il2cpp_TypeInfo_var);
	Il2CppCodeGenWriteBarrier((void**)(&unmarshaled.___Updated_1), (void*)il2cpp_codegen_marshal_function_ptr_to_delegate<Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C>(marshaled.___Updated_1, Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_il2cpp_TypeInfo_var));
}
IL2CPP_EXTERN_C void RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshal_com_cleanup(RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52_marshaled_com& marshaled)
{
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void RemoteConfigSettings_RemoteConfigSettingsUpdated_mA71E7C6CDAF5D349BF0B4880A4D54DF2365EB948 (RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52* ___rcs0, bool ___wasLastUpdatedFromServer1, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&RemoteConfigSettings_RemoteConfigSettingsUpdated_mA71E7C6CDAF5D349BF0B4880A4D54DF2365EB948_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C* V_0 = NULL;
	bool V_1 = false;
	DECLARE_METHOD_PARAMS(methodExecutionContextParameters, (&___rcs0), (&___wasLastUpdatedFromServer1));
	DECLARE_METHOD_LOCALS(methodExecutionContextLocals, (&V_0));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, RemoteConfigSettings_RemoteConfigSettingsUpdated_mA71E7C6CDAF5D349BF0B4880A4D54DF2365EB948_RuntimeMethod_var, NULL, methodExecutionContextParameters, methodExecutionContextLocals);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 27));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 28));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 29));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 30));
		RemoteConfigSettings_tC979947EE51355162B3241B9F80D95A8FD25FE52* L_0 = ___rcs0;
		NullCheck(L_0);
		Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C* L_1 = L_0->___Updated_1;
		V_0 = L_1;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 31));
		Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C* L_2 = V_0;
		V_1 = (bool)((!(((RuntimeObject*)(Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C*)L_2) <= ((RuntimeObject*)(RuntimeObject*)NULL)))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 32));
		bool L_3 = V_1;
		if (!L_3)
		{
			goto IL_0018;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 33));
		Action_1_t10DCB0C07D0D3C565CEACADC80D1152B35A45F6C* L_4 = V_0;
		bool L_5 = ___wasLastUpdatedFromServer1;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 34));
		NullCheck(L_4);
		Action_1_Invoke_m69C8773D6967F3B224777183E24EA621CE056F8F_inline(L_4, L_5, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 34));
	}

IL_0018:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 35));
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void AnalyticsSessionInfo_CallSessionStateChanged_m6C3C7DD13064E37D7C3AE9411355BCEF77C4664B (int32_t ___sessionState0, int64_t ___sessionId1, int64_t ___sessionElapsedTime2, bool ___sessionChanged3, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&AnalyticsSessionInfo_CallSessionStateChanged_m6C3C7DD13064E37D7C3AE9411355BCEF77C4664B_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76_il2cpp_TypeInfo_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* V_0 = NULL;
	bool V_1 = false;
	DECLARE_METHOD_PARAMS(methodExecutionContextParameters, (&___sessionState0), (&___sessionId1), (&___sessionElapsedTime2), (&___sessionChanged3));
	DECLARE_METHOD_LOCALS(methodExecutionContextLocals, (&V_0));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, AnalyticsSessionInfo_CallSessionStateChanged_m6C3C7DD13064E37D7C3AE9411355BCEF77C4664B_RuntimeMethod_var, NULL, methodExecutionContextParameters, methodExecutionContextLocals);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 36));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 37));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 38));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 39));
		SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* L_0 = ((AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76_StaticFields*)il2cpp_codegen_static_fields_for(AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76_il2cpp_TypeInfo_var))->___sessionStateChanged_0;
		V_0 = L_0;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 40));
		SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* L_1 = V_0;
		V_1 = (bool)((!(((RuntimeObject*)(SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C*)L_1) <= ((RuntimeObject*)(RuntimeObject*)NULL)))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 41));
		bool L_2 = V_1;
		if (!L_2)
		{
			goto IL_001a;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 42));
		SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* L_3 = V_0;
		int32_t L_4 = ___sessionState0;
		int64_t L_5 = ___sessionId1;
		int64_t L_6 = ___sessionElapsedTime2;
		bool L_7 = ___sessionChanged3;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 43));
		NullCheck(L_3);
		SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5_inline(L_3, L_4, L_5, L_6, L_7, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 43));
	}

IL_001a:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 44));
		return;
	}
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void AnalyticsSessionInfo_CallIdentityTokenChanged_m1AD21A1840BCB9CB222455F609DBBF7B7B380911 (String_t* ___token0, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&AnalyticsSessionInfo_CallIdentityTokenChanged_m1AD21A1840BCB9CB222455F609DBBF7B7B380911_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76_il2cpp_TypeInfo_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* V_0 = NULL;
	bool V_1 = false;
	DECLARE_METHOD_PARAMS(methodExecutionContextParameters, (&___token0));
	DECLARE_METHOD_LOCALS(methodExecutionContextLocals, (&V_0));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, AnalyticsSessionInfo_CallIdentityTokenChanged_m1AD21A1840BCB9CB222455F609DBBF7B7B380911_RuntimeMethod_var, NULL, methodExecutionContextParameters, methodExecutionContextLocals);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 45));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 46));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 47));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 48));
		IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* L_0 = ((AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76_StaticFields*)il2cpp_codegen_static_fields_for(AnalyticsSessionInfo_tDE8F7A9E13EF9723E2D975F76E916753DA61AD76_il2cpp_TypeInfo_var))->___identityTokenChanged_1;
		V_0 = L_0;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 49));
		IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* L_1 = V_0;
		V_1 = (bool)((!(((RuntimeObject*)(IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395*)L_1) <= ((RuntimeObject*)(RuntimeObject*)NULL)))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 50));
		bool L_2 = V_1;
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 51));
		IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* L_3 = V_0;
		String_t* L_4 = ___token0;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 52));
		NullCheck(L_3);
		IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_inline(L_3, L_4, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 52));
	}

IL_0017:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 53));
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
void SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5_Multicast(SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* __this, int32_t ___sessionState0, int64_t ___sessionId1, int64_t ___sessionElapsedTime2, bool ___sessionChanged3, const RuntimeMethod* method)
{
	il2cpp_array_size_t length = __this->___delegates_13->max_length;
	Delegate_t** delegatesToInvoke = reinterpret_cast<Delegate_t**>(__this->___delegates_13->GetAddressAtUnchecked(0));
	for (il2cpp_array_size_t i = 0; i < length; i++)
	{
		SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* currentDelegate = reinterpret_cast<SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C*>(delegatesToInvoke[i]);
		typedef void (*FunctionPointerType) (RuntimeObject*, int32_t, int64_t, int64_t, bool, const RuntimeMethod*);
		((FunctionPointerType)currentDelegate->___invoke_impl_1)((Il2CppObject*)currentDelegate->___method_code_6, ___sessionState0, ___sessionId1, ___sessionElapsedTime2, ___sessionChanged3, reinterpret_cast<RuntimeMethod*>(currentDelegate->___method_3));
	}
}
void SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5_OpenInst(SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* __this, int32_t ___sessionState0, int64_t ___sessionId1, int64_t ___sessionElapsedTime2, bool ___sessionChanged3, const RuntimeMethod* method)
{
	typedef void (*FunctionPointerType) (int32_t, int64_t, int64_t, bool, const RuntimeMethod*);
	((FunctionPointerType)__this->___method_ptr_0)(___sessionState0, ___sessionId1, ___sessionElapsedTime2, ___sessionChanged3, method);
}
void SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5_OpenStatic(SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* __this, int32_t ___sessionState0, int64_t ___sessionId1, int64_t ___sessionElapsedTime2, bool ___sessionChanged3, const RuntimeMethod* method)
{
	typedef void (*FunctionPointerType) (int32_t, int64_t, int64_t, bool, const RuntimeMethod*);
	((FunctionPointerType)__this->___method_ptr_0)(___sessionState0, ___sessionId1, ___sessionElapsedTime2, ___sessionChanged3, method);
}
IL2CPP_EXTERN_C  void DelegatePInvokeWrapper_SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C (SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* __this, int32_t ___sessionState0, int64_t ___sessionId1, int64_t ___sessionElapsedTime2, bool ___sessionChanged3, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc)(int32_t, int64_t, int64_t, int32_t);
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(il2cpp_codegen_get_reverse_pinvoke_function_ptr(__this));
	il2cppPInvokeFunc(___sessionState0, ___sessionId1, ___sessionElapsedTime2, static_cast<int32_t>(___sessionChanged3));

}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void SessionStateChanged__ctor_m8E04BB6766439BA455F9C808171BD791230496D8 (SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* __this, RuntimeObject* ___object0, intptr_t ___method1, const RuntimeMethod* method) 
{
	__this->___method_ptr_0 = il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1);
	__this->___method_3 = ___method1;
	__this->___m_target_2 = ___object0;
	Il2CppCodeGenWriteBarrier((void**)(&__this->___m_target_2), (void*)___object0);
	int parameterCount = il2cpp_codegen_method_parameter_count((RuntimeMethod*)___method1);
	__this->___method_code_6 = (intptr_t)__this;
	if (MethodIsStatic((RuntimeMethod*)___method1))
	{
		bool isOpen = parameterCount == 4;
		if (isOpen)
			__this->___invoke_impl_1 = (intptr_t)&SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5_OpenStatic;
		else
			{
				__this->___invoke_impl_1 = (intptr_t)__this->___method_ptr_0;
				__this->___method_code_6 = (intptr_t)__this->___m_target_2;
			}
	}
	else
	{
		if (___object0 == NULL)
			il2cpp_codegen_raise_exception(il2cpp_codegen_get_argument_exception(NULL, "Delegate to an instance method cannot have null 'this'."), NULL);
		__this->___invoke_impl_1 = (intptr_t)__this->___method_ptr_0;
		__this->___method_code_6 = (intptr_t)__this->___m_target_2;
	}
	__this->___extra_arg_5 = (intptr_t)&SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5_Multicast;
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5 (SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* __this, int32_t ___sessionState0, int64_t ___sessionId1, int64_t ___sessionElapsedTime2, bool ___sessionChanged3, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, int32_t, int64_t, int64_t, bool, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, ___sessionState0, ___sessionId1, ___sessionElapsedTime2, ___sessionChanged3, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
void IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_Multicast(IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* __this, String_t* ___token0, const RuntimeMethod* method)
{
	il2cpp_array_size_t length = __this->___delegates_13->max_length;
	Delegate_t** delegatesToInvoke = reinterpret_cast<Delegate_t**>(__this->___delegates_13->GetAddressAtUnchecked(0));
	for (il2cpp_array_size_t i = 0; i < length; i++)
	{
		IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* currentDelegate = reinterpret_cast<IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395*>(delegatesToInvoke[i]);
		typedef void (*FunctionPointerType) (RuntimeObject*, String_t*, const RuntimeMethod*);
		((FunctionPointerType)currentDelegate->___invoke_impl_1)((Il2CppObject*)currentDelegate->___method_code_6, ___token0, reinterpret_cast<RuntimeMethod*>(currentDelegate->___method_3));
	}
}
void IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_OpenInst(IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* __this, String_t* ___token0, const RuntimeMethod* method)
{
	NullCheck(___token0);
	typedef void (*FunctionPointerType) (String_t*, const RuntimeMethod*);
	((FunctionPointerType)__this->___method_ptr_0)(___token0, method);
}
void IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_OpenStatic(IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* __this, String_t* ___token0, const RuntimeMethod* method)
{
	typedef void (*FunctionPointerType) (String_t*, const RuntimeMethod*);
	((FunctionPointerType)__this->___method_ptr_0)(___token0, method);
}
IL2CPP_EXTERN_C  void DelegatePInvokeWrapper_IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395 (IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* __this, String_t* ___token0, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc)(char*);
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(il2cpp_codegen_get_reverse_pinvoke_function_ptr(__this));
	char* ____token0_marshaled = NULL;
	____token0_marshaled = il2cpp_codegen_marshal_string(___token0);

	il2cppPInvokeFunc(____token0_marshaled);

	il2cpp_codegen_marshal_free(____token0_marshaled);
	____token0_marshaled = NULL;

}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void IdentityTokenChanged__ctor_m1970F8BEEDAA84A8FC5ABB973C0DB62FA2AA8312 (IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* __this, RuntimeObject* ___object0, intptr_t ___method1, const RuntimeMethod* method) 
{
	__this->___method_ptr_0 = il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1);
	__this->___method_3 = ___method1;
	__this->___m_target_2 = ___object0;
	Il2CppCodeGenWriteBarrier((void**)(&__this->___m_target_2), (void*)___object0);
	int parameterCount = il2cpp_codegen_method_parameter_count((RuntimeMethod*)___method1);
	__this->___method_code_6 = (intptr_t)__this;
	if (MethodIsStatic((RuntimeMethod*)___method1))
	{
		bool isOpen = parameterCount == 1;
		if (isOpen)
			__this->___invoke_impl_1 = (intptr_t)&IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_OpenStatic;
		else
			{
				__this->___invoke_impl_1 = (intptr_t)__this->___method_ptr_0;
				__this->___method_code_6 = (intptr_t)__this->___m_target_2;
			}
	}
	else
	{
		bool isOpen = parameterCount == 0;
		if (isOpen)
		{
			__this->___invoke_impl_1 = (intptr_t)&IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_OpenInst;
		}
		else
		{
			if (___object0 == NULL)
				il2cpp_codegen_raise_exception(il2cpp_codegen_get_argument_exception(NULL, "Delegate to an instance method cannot have null 'this'."), NULL);
			__this->___invoke_impl_1 = (intptr_t)__this->___method_ptr_0;
			__this->___method_code_6 = (intptr_t)__this->___m_target_2;
		}
	}
	__this->___extra_arg_5 = (intptr_t)&IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_Multicast;
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9 (IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* __this, String_t* ___token0, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, String_t*, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, ___token0, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool Analytics_IsInitialized_mBC7670704DE959791C8DF859A7C66D5DD5168F12 (const RuntimeMethod* method) 
{
	typedef bool (*Analytics_IsInitialized_mBC7670704DE959791C8DF859A7C66D5DD5168F12_ftn) ();
	static Analytics_IsInitialized_mBC7670704DE959791C8DF859A7C66D5DD5168F12_ftn _il2cpp_icall_func;
	if (!_il2cpp_icall_func)
	_il2cpp_icall_func = (Analytics_IsInitialized_mBC7670704DE959791C8DF859A7C66D5DD5168F12_ftn)il2cpp_codegen_resolve_icall ("UnityEngine.Analytics.Analytics::IsInitialized()");
	bool icallRetVal = _il2cpp_icall_func();
	return icallRetVal;
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t Analytics_RegisterEventWithLimit_m1C2E9701EE73122C7788186C9EA9A3C23CF51252 (String_t* ___eventName0, int32_t ___maxEventPerHour1, int32_t ___maxItems2, String_t* ___vendorKey3, int32_t ___ver4, String_t* ___prefix5, String_t* ___assemblyInfo6, bool ___notifyServer7, const RuntimeMethod* method) 
{
	typedef int32_t (*Analytics_RegisterEventWithLimit_m1C2E9701EE73122C7788186C9EA9A3C23CF51252_ftn) (String_t*, int32_t, int32_t, String_t*, int32_t, String_t*, String_t*, bool);
	static Analytics_RegisterEventWithLimit_m1C2E9701EE73122C7788186C9EA9A3C23CF51252_ftn _il2cpp_icall_func;
	if (!_il2cpp_icall_func)
	_il2cpp_icall_func = (Analytics_RegisterEventWithLimit_m1C2E9701EE73122C7788186C9EA9A3C23CF51252_ftn)il2cpp_codegen_resolve_icall ("UnityEngine.Analytics.Analytics::RegisterEventWithLimit(System.String,System.Int32,System.Int32,System.String,System.Int32,System.String,System.String,System.Boolean)");
	int32_t icallRetVal = _il2cpp_icall_func(___eventName0, ___maxEventPerHour1, ___maxItems2, ___vendorKey3, ___ver4, ___prefix5, ___assemblyInfo6, ___notifyServer7);
	return icallRetVal;
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t Analytics_SendEventWithLimit_m084C487537F41F55CA161ED14838A6B892421956 (String_t* ___eventName0, RuntimeObject* ___parameters1, int32_t ___ver2, String_t* ___prefix3, const RuntimeMethod* method) 
{
	typedef int32_t (*Analytics_SendEventWithLimit_m084C487537F41F55CA161ED14838A6B892421956_ftn) (String_t*, RuntimeObject*, int32_t, String_t*);
	static Analytics_SendEventWithLimit_m084C487537F41F55CA161ED14838A6B892421956_ftn _il2cpp_icall_func;
	if (!_il2cpp_icall_func)
	_il2cpp_icall_func = (Analytics_SendEventWithLimit_m084C487537F41F55CA161ED14838A6B892421956_ftn)il2cpp_codegen_resolve_icall ("UnityEngine.Analytics.Analytics::SendEventWithLimit(System.String,System.Object,System.Int32,System.String)");
	int32_t icallRetVal = _il2cpp_icall_func(___eventName0, ___parameters1, ___ver2, ___prefix3);
	return icallRetVal;
}
IL2CPP_EXTERN_C IL2CPP_NO_INLINE IL2CPP_METHOD_ATTR int32_t Analytics_RegisterEvent_mC82148D11A02968E347F9D11237D50826223A7C3 (String_t* ___eventName0, int32_t ___maxEventPerHour1, int32_t ___maxItems2, String_t* ___vendorKey3, String_t* ___prefix4, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&AnalyticsResult_tD3F23442DE6D00D9F160F7C9D3C7E3C5DEB91DCE_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Analytics_RegisterEvent_mC82148D11A02968E347F9D11237D50826223A7C3_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&String_t_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&String_t_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	int32_t V_1 = 0;
	DECLARE_METHOD_PARAMS(methodExecutionContextParameters, (&___eventName0), (&___maxEventPerHour1), (&___maxItems2), (&___vendorKey3), (&___prefix4));
	DECLARE_METHOD_LOCALS(methodExecutionContextLocals, (&V_0));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, Analytics_RegisterEvent_mC82148D11A02968E347F9D11237D50826223A7C3_RuntimeMethod_var, NULL, methodExecutionContextParameters, methodExecutionContextLocals);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 54));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 55));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 56));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 57));
		String_t* L_0 = ((String_t_StaticFields*)il2cpp_codegen_static_fields_for(String_t_il2cpp_TypeInfo_var))->___Empty_6;
		V_0 = L_0;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 58));
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 59));
		Assembly_t* L_1;
		L_1 = Assembly_GetCallingAssembly_mDA96275EB27A0792D97CF9E45FB7919F39A3F97E(NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 59));
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 60));
		NullCheck(L_1);
		String_t* L_2;
		L_2 = VirtualFuncInvoker0< String_t* >::Invoke(9, L_1);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 60));
		V_0 = L_2;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 61));
		String_t* L_3 = ___eventName0;
		int32_t L_4 = ___maxEventPerHour1;
		int32_t L_5 = ___maxItems2;
		String_t* L_6 = ___vendorKey3;
		String_t* L_7 = ___prefix4;
		String_t* L_8 = V_0;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 62));
		int32_t L_9;
		L_9 = Analytics_RegisterEvent_m82BE2F186E2F452E6FFE10DC44207C3438E660E4(L_3, L_4, L_5, L_6, 1, L_7, L_8, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 62));
		V_1 = L_9;
		goto IL_0022;
	}

IL_0022:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 63));
		int32_t L_10 = V_1;
		return L_10;
	}
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t Analytics_RegisterEvent_m82BE2F186E2F452E6FFE10DC44207C3438E660E4 (String_t* ___eventName0, int32_t ___maxEventPerHour1, int32_t ___maxItems2, String_t* ___vendorKey3, int32_t ___ver4, String_t* ___prefix5, String_t* ___assemblyInfo6, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&AnalyticsResult_tD3F23442DE6D00D9F160F7C9D3C7E3C5DEB91DCE_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Analytics_RegisterEvent_m82BE2F186E2F452E6FFE10DC44207C3438E660E4_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	bool V_0 = false;
	bool V_1 = false;
	int32_t V_2 = 0;
	DECLARE_METHOD_PARAMS(methodExecutionContextParameters, (&___eventName0), (&___maxEventPerHour1), (&___maxItems2), (&___vendorKey3), (&___ver4), (&___prefix5), (&___assemblyInfo6));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, Analytics_RegisterEvent_m82BE2F186E2F452E6FFE10DC44207C3438E660E4_RuntimeMethod_var, NULL, methodExecutionContextParameters, NULL);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 64));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 65));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 66));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 67));
		String_t* L_0 = ___eventName0;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 68));
		bool L_1;
		L_1 = String_IsNullOrEmpty_mEA9E3FB005AC28FE02E69FCF95A7B8456192B478(L_0, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 68));
		V_0 = L_1;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 69));
		bool L_2 = V_0;
		if (!L_2)
		{
			goto IL_0016;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 70));
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 71));
		ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263* L_3 = (ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263*)il2cpp_codegen_object_new(((RuntimeClass*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263_il2cpp_TypeInfo_var)));
		ArgumentException__ctor_m026938A67AF9D36BB7ED27F80425D7194B514465(L_3, ((String_t*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&_stringLiteral2276B6A66302EB28763BDF59157B4221777ADB5A)), NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 71));
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_3, ((RuntimeMethod*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&Analytics_RegisterEvent_m82BE2F186E2F452E6FFE10DC44207C3438E660E4_RuntimeMethod_var)));
	}

IL_0016:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 72));
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 73));
		bool L_4;
		L_4 = Analytics_IsInitialized_mBC7670704DE959791C8DF859A7C66D5DD5168F12(NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 73));
		V_1 = (bool)((((int32_t)L_4) == ((int32_t)0))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 74));
		bool L_5 = V_1;
		if (!L_5)
		{
			goto IL_0026;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 75));
		V_2 = 1;
		goto IL_0039;
	}

IL_0026:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 76));
		String_t* L_6 = ___eventName0;
		int32_t L_7 = ___maxEventPerHour1;
		int32_t L_8 = ___maxItems2;
		String_t* L_9 = ___vendorKey3;
		int32_t L_10 = ___ver4;
		String_t* L_11 = ___prefix5;
		String_t* L_12 = ___assemblyInfo6;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 77));
		int32_t L_13;
		L_13 = Analytics_RegisterEventWithLimit_m1C2E9701EE73122C7788186C9EA9A3C23CF51252(L_6, L_7, L_8, L_9, L_10, L_11, L_12, (bool)1, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 77));
		V_2 = L_13;
		goto IL_0039;
	}

IL_0039:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 78));
		int32_t L_14 = V_2;
		return L_14;
	}
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t Analytics_SendEvent_m9E942728E301EA9E90741ADD1ED71DAD118819B5 (String_t* ___eventName0, RuntimeObject* ___parameters1, int32_t ___ver2, String_t* ___prefix3, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&AnalyticsResult_tD3F23442DE6D00D9F160F7C9D3C7E3C5DEB91DCE_0_0_0_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Analytics_SendEvent_m9E942728E301EA9E90741ADD1ED71DAD118819B5_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	bool V_0 = false;
	bool V_1 = false;
	bool V_2 = false;
	int32_t V_3 = 0;
	DECLARE_METHOD_PARAMS(methodExecutionContextParameters, (&___eventName0), (&___parameters1), (&___ver2), (&___prefix3));
	DECLARE_METHOD_EXEC_CTX(methodExecutionContext, Analytics_SendEvent_m9E942728E301EA9E90741ADD1ED71DAD118819B5_RuntimeMethod_var, NULL, methodExecutionContextParameters, NULL);
	CHECK_METHOD_ENTRY_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 79));
	CHECK_METHOD_EXIT_SEQ_POINT(methodExitChecker, methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 80));
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 81));
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 82));
		String_t* L_0 = ___eventName0;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 83));
		bool L_1;
		L_1 = String_IsNullOrEmpty_mEA9E3FB005AC28FE02E69FCF95A7B8456192B478(L_0, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 83));
		V_0 = L_1;
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 84));
		bool L_2 = V_0;
		if (!L_2)
		{
			goto IL_0016;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 85));
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 86));
		ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263* L_3 = (ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263*)il2cpp_codegen_object_new(((RuntimeClass*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263_il2cpp_TypeInfo_var)));
		ArgumentException__ctor_m026938A67AF9D36BB7ED27F80425D7194B514465(L_3, ((String_t*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&_stringLiteral2276B6A66302EB28763BDF59157B4221777ADB5A)), NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 86));
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_3, ((RuntimeMethod*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&Analytics_SendEvent_m9E942728E301EA9E90741ADD1ED71DAD118819B5_RuntimeMethod_var)));
	}

IL_0016:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 87));
		RuntimeObject* L_4 = ___parameters1;
		V_1 = (bool)((((RuntimeObject*)(RuntimeObject*)L_4) == ((RuntimeObject*)(RuntimeObject*)NULL))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 88));
		bool L_5 = V_1;
		if (!L_5)
		{
			goto IL_0029;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 89));
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 90));
		ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263* L_6 = (ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263*)il2cpp_codegen_object_new(((RuntimeClass*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&ArgumentException_tAD90411542A20A9C72D5CDA3A84181D8B947A263_il2cpp_TypeInfo_var)));
		ArgumentException__ctor_m026938A67AF9D36BB7ED27F80425D7194B514465(L_6, ((String_t*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&_stringLiteralECCC4B7A0DA4E8DB493886ED11AC56BA55FBE86F)), NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 90));
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_6, ((RuntimeMethod*)il2cpp_codegen_initialize_runtime_metadata_inline((uintptr_t*)&Analytics_SendEvent_m9E942728E301EA9E90741ADD1ED71DAD118819B5_RuntimeMethod_var)));
	}

IL_0029:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 91));
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 92));
		bool L_7;
		L_7 = Analytics_IsInitialized_mBC7670704DE959791C8DF859A7C66D5DD5168F12(NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 92));
		V_2 = (bool)((((int32_t)L_7) == ((int32_t)0))? 1 : 0);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 93));
		bool L_8 = V_2;
		if (!L_8)
		{
			goto IL_0039;
		}
	}
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 94));
		V_3 = 1;
		goto IL_0045;
	}

IL_0039:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 95));
		String_t* L_9 = ___eventName0;
		RuntimeObject* L_10 = ___parameters1;
		int32_t L_11 = ___ver2;
		String_t* L_12 = ___prefix3;
		STORE_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 96));
		int32_t L_13;
		L_13 = Analytics_SendEventWithLimit_m084C487537F41F55CA161ED14838A6B892421956(L_9, L_10, L_11, L_12, NULL);
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 96));
		V_3 = L_13;
		goto IL_0045;
	}

IL_0045:
	{
		CHECK_SEQ_POINT(methodExecutionContext, (g_sequencePointsUnityEngine_UnityAnalyticsModule + 97));
		int32_t L_14 = V_3;
		return L_14;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void UpdatedEventHandler_Invoke_m4D496F648FD908A8537A35C4A94CBB44294D6D50_inline (UpdatedEventHandler_tB0D5A5BA322FE093894992C29DCF51E7E12579C4* __this, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void Action_Invoke_m7126A54DACA72B845424072887B5F3A51FC3808E_inline (Action_tD00B0A84D7945E50C2DFFC28EFEE6ED44ED2AD07* __this, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void SessionStateChanged_Invoke_mB9195B30A226CB3E53E470C24FD31E039E5BB4F5_inline (SessionStateChanged_t1180FB66E702B635CAD9316DC661D931277B2A0C* __this, int32_t ___sessionState0, int64_t ___sessionId1, int64_t ___sessionElapsedTime2, bool ___sessionChanged3, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, int32_t, int64_t, int64_t, bool, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, ___sessionState0, ___sessionId1, ___sessionElapsedTime2, ___sessionChanged3, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void IdentityTokenChanged_Invoke_m22D3DA825F0D6E701D050EFA3D35E84DFAC7F8D9_inline (IdentityTokenChanged_tE8CB0DAB5F6E640A847803F582E6CB6237742395* __this, String_t* ___token0, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, String_t*, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, ___token0, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void Action_3_Invoke_m20DB96A6E4363A11EE736FB20842C52E012CA3D6_gshared_inline (Action_3_t838D6B6BB4BFFC6E8430C389747DB008A0B26146* __this, Il2CppFullySharedGenericAny ___arg10, Il2CppFullySharedGenericAny ___arg21, Il2CppFullySharedGenericAny ___arg32, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, Il2CppFullySharedGenericAny, Il2CppFullySharedGenericAny, Il2CppFullySharedGenericAny, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, ___arg10, ___arg21, ___arg32, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
IL2CPP_MANAGED_FORCE_INLINE IL2CPP_METHOD_ATTR void Action_1_Invoke_m5A038831CEB84A7E374FE59D43444412629F833F_gshared_inline (Action_1_t923A20D1D4F6B55B2ED5AE21B90F1A0CE0450D99* __this, Il2CppFullySharedGenericAny ___obj0, const RuntimeMethod* method) 
{
	typedef void (*FunctionPointerType) (RuntimeObject*, Il2CppFullySharedGenericAny, const RuntimeMethod*);
	((FunctionPointerType)__this->___invoke_impl_1)((Il2CppObject*)__this->___method_code_6, ___obj0, reinterpret_cast<RuntimeMethod*>(__this->___method_3));
}
