mf_s_zone_markers select {
	!(localNamespace getVariable _x select struct_zone_m_captured)
	&&
	{!(para_g_cops inAreaArray [markerPos _x, mf_s_copZoneUnlockDistance, mf_s_copZoneUnlockDistance, 0] isEqualTo [])}
}