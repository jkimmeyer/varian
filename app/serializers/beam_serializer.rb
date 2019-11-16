class BeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :energy_mode, :technique, :monitor_units, :gantry_angle_start, :gantry_angle_stop, :patient_support_angle, :collimator_angle, :number_of_control_points, :jaw_positions, :isocenter
end
