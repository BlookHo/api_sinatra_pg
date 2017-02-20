class Company < Sequel::Model
  one_to_many :jobs

  plugin :validation_helpers


  def to_api # Not for array!!
    {
      id: id,
      name: name,
      location: location
    }
  end

  def validate
    super
    errors.add(:name, "can't be empty") if name.empty?
    # errors.add(:written_on, "should be in the past") if written_on >= Time.now
    validates_presence [:name, :location]
    validates_unique [:name]
  end

  # Album.subset(:by_name, name){where(name: /#{name}/i)}

  dataset_module do # Model scope's
    def by_name(name)
      puts 'In by_name dataset mod'
      where(name: /#{name}/i) if name
    end

    def by_location(location)
      puts 'In by_location dataset mod'
      where(location: /#{location}/i) if location
    end
  end

  def self.company_jobs(name)
    company = Company.by_name(name)#[:id]
    puts "company = #{company.columns.inspect}"
    # company = [:id, :name, :location, :created_at, :upated_at]

    puts "company = #{company.map(:id).inspect}"
    # company = [2]

    company_id = company.map(:id)[0]
    puts "company_id = #{company_id.inspect}"
    # company_id = company.select(:id).naked.all.inspect
    # "[{:id=>2}]"

    company_id.nil? ? [].to_json : company_id.to_json

    # puts "company_id = #{company_id}"
    # company_jobs = Job.company_jobs(company_id)
    # puts "company_jobs = #{company_jobs.count}"
    # company_jobs.blank? ? [].to_json : company_jobs.to_json
  end


  def call_one_method(model_name, method, params)
    if params
      model_name.send(method, params)
    else
      puts "Enter Name!"
      [].to_json
    end
  end

end
