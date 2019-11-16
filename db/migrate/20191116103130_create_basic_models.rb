class CreateBasicModels < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    create_table :treatment_plans do |t|
      t.string :name
      t.integer :number_of_fractions
      t.decimal :planned_dose_per_fraction, precision: 15, scale: 10
      t.text :grid_size
      t.references :patient

      t.timestamps
    end

    create_table :image_3ds do |t|
      t.string :name
      t.text :grid_size
      t.references :treatment_plan

      t.timestamps
    end

    create_table :structures do |t|
      t.string :name
      t.decimal :volume, precision: 15, scale: 10
      t.text :center_point
      t.string :color
      t.boolean :is_target_structure
      t.references :image_3d

      t.timestamps
    end

    create_table :beams do |t|
      t.string :name
      t.string :energy_mode
      t.string :technique
      t.decimal :monitor_units, precision: 15, scale: 10
      t.decimal :gantry_angle_start, precision: 15, scale: 10
      t.decimal :gantry_angle_stop, precision: 15, scale: 10
      t.decimal :patient_support_angle, precision: 15, scale: 10
      t.decimal :collimator_angle, precision: 15, scale: 10
      t.integer :number_of_control_points
      t.string :jaw_positions
      t.text :isocenter
      t.references :treatment_plan

      t.timestamps
    end

    create_table :isodoses do |t|
      t.decimal :level, precision: 15, scale: 10
      t.decimal :volume, precision: 15, scale: 10
      t.references :treatment_plan

      t.timestamps
    end

    create_table :dvh_curves do |t|
      t.string :name
      t.decimal :min_dose, precision: 15, scale: 10
      t.decimal :max_dose, precision: 15, scale: 10
      t.decimal :mean_dose, precision: 15, scale: 10
      t.text :curve_points
      t.references :treatment_plan

      t.timestamps
    end
  end
end
