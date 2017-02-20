Sequel.migration do
  change do
    create_table(:applys) do
      primary_key :id
      TrueClass :read, :default => false
      TrueClass :invited, :default => false
      foreign_key :job_id, :jobs, :null => false
      foreign_key :geek_id, :geeks, :null => false

      DateTime :created_at
      DateTime :upated_at

      index :id

    end
  end
end
