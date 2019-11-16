class SetDefaultStatusToCreated < ActiveRecord::Migration[6.0]
  def change
    TreatmentPlan.where(status: nil).update_all(status: 'created')
    change_column :treatment_plans, :status, :string, default: 'created', null: false
  end
end
