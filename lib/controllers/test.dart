// class MyModel {
//   ///Section 1
//   String? customer,
//       workorder,
//       location,
//       lsd,
//       engine_make,
//       engine_model,
//       engine_serial,
//       engine_arrangement;
//   List<String>? mechanics;
//   int? unit;
//   DateTime? date;
//
//   ///Section 2
//   String? engine_blocks, company, engine_crankshaft;
//   bool? line_bore_performed, mag_checked_for_cracks, liner_fits_repaired;
//   List<String>? engine_assembly_report_indicate_which_one,
//       engine_report_indicate_which_one;
//
//   // "": {
//   // "spec": "0.0015 - 0.003 inches",
//   // "actual": "0.002 inches"
//   // },
//   // "": {
//   // "spec": "0.002 - 0.007 inches",
//   // "actual": "0.005 inches"
//   // }
//   Map<String, dynamic>? plasti_guage_readings_one_main_bearing, end_play;
//
//   ///Section 3
//   // {
//   // "part_name": "Oil Pump",
//   // "new": false,
//   // "re_conditioned": false,
//   // "re_used": false,
//   // "exchange": true
//   // },
//   List<Map<String, dynamic>>? engine_assembly_parts_exchange_catalog;
//
//   ///Section 4
//   String? engine_assembly,
//       reason_if_not_replaced,
//       main_bearing_torque_spec,
//       cross_ties_torqued_spec,
//       counter_weights_torqued_spec,
//       connection_rods,
//       reason_if_not_connection_rod_bearings_replaced,
//       rod_bearing_caps_torqued_spec,
//       connection_rod_side_clearance_checked_spec,
//       piston_pins,
//       pistons,
//       cylinder_liners,
//       cylinder_heads,
//       cylinder_head_spec,
//       rocker_shaft_assemblies,
//       rocker_shaft_assemblies_spec,
//       push_rods,
//       camshaft,
//       camshaft_bearing_torqued_spec,
//       cam_followers,
//       bridges_settings;
//   bool? main_bearings_replaced,
//       thrust_bearings_replaced,
//       cross_ties_torqued,
//       counter_weights_torqued,
//       vibration_dampener_replaced_torqued,
//       front_and_rear_seals_replaced,
//       connection_rod_bearings_replaced,
//       rod_bearing_caps_torqued,
//       connection_rod_side_clearance_checked,
//       liner_packs,
//       liner_o_rings_replaced,
//       cylinder_heads_torqued,
//       rocker_shaft_assemblies_torqued,
//       camshaft_bearing_replaced,
//       camshaft_bearing_torqued,
//       camshaft_end_play_checked;
//   double? numer_of_uper_shell_thickness,
//       number_of_lower_shell_thickness,
//       main_bearing_torque;
//   List<String>? connection_rods_indicate_which_one,
//       actual_reading,
//       indicate_new_pistons,
//       indicate_new_pins,
//       indicate_new_liners,
//       indicate_cylinder_heads,
//       rocker_shaft_assemblies_indicate_which_one,
//       injector_trim_codes;
//
//   // "front_and_rear_seals_replaced_desc": {
//   // "front": "You can check but not found any Issue",
//   // "rear": "There is Some abnormal voices"
//   // }
//   // {
//   // "piston": 1,
//   // "ring_1": 0.5,
//   // "ring_2": 0.6,
//   // "ring_3": 0.7,
//   // "ring_4": 0.8
//   // },
//   // {
//   // "piston": 1,
//   // "ring_1": 0.5,
//   // "ring_2": 0.6,
//   // "ring_3": 0.7,
//   // "ring_4": 0.8
//   // },
//   // "camshaft_end_play_checked_spec": {
//   // "spec": "123",
//   // "actual": "6651"
//   // }
//   Map<String, dynamic>? front_and_rear_seals_replaced_desc,
//       ring_clearances_linear,
//       ring_clearances_pistons,
//       camshaft_end_play_checked_spec;
//
//   // [
//   // {
//   // "intake": 0.1,
//   // "exhaust": 0.2,
//   // "injector": 0.3
//   // },
//   // ]
//   List<Map<String, dynamic>>? valve;
//
//   ///Section 5
//   // {
//   // "part_name": "Cam Gear (s)",
//   // "new": false,
//   // "re_used": true,
//   // "back_lash": 0.008
//   // },
//   List<Map<String, dynamic>>? gear_train;
//
//   ///Section 6
//   String? type;
// }
//
// // {
// // "customer_engine_info": {},
// // "engine_assembly": {},
// // "engine_assembly_parts_exchange_catalog": [],
// // "engine_assembly_report_cont": {},
// // "gear_train": [],
// // "type": "L7042GL C-14871"
// // }
