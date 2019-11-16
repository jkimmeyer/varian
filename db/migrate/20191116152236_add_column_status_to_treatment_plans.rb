class AddColumnStatusToTreatmentPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :treatment_plans, :status, :string
  end
end
