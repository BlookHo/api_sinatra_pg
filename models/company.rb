class Company
  include Mongoid::Document

  field :name, type: String
  field :location, type: String
  # field :job, type: String

  validates :name, presence: true
  validates :location, presence: true

  index({ name: 'text' }, { unique: true })
  # index({ isbn:1 }, { unique: true, name: "isbn_index" })

  # embeds_many :jobs, class_name: "Job"

  scope :co_name, -> (name) { where(name: /#{name}/i) }
  scope :location, -> (location) { where(location: /#{location}/i) }

  def self.company_jobs(name)
    company_id = co_name(name)[0].id
    # puts "company_id = #{company_id}"
    company_jobs = Job.company_jobs(company_id)
    # puts "company_jobs = #{company_jobs.count}"
    company_jobs.blank? ? [].to_json : company_jobs.to_json
  end


end

# //mongoimport --db mgeeksongo_hirer_dev --collection jobs --file jobs_seed.json
# ///home/flyingminer/RubymineProjects/Sinatra/api_hirer/seeds/jobs_seed.json
