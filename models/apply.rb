class Apply
  include Mongoid::Document

  field :job_id, type: Object
  field :geek_id, type: Object
  field :read, type: Boolean, default: false
  field :invited, type: Boolean, default: false

  validates :name, presence: true
  validates :location, presence: true
  # validates :resume, presence: true

  index({ job_id: 1 })
  # index({ isbn:1 }, { unique: true, name: "isbn_index" })

  scope :job_id, -> (job_id) { where(job_id: "#{job_id}") }
  scope :geek_id, -> (geek_id) { where(geek_id: geek_id) }
  scope :apply_geek, -> (geek_id) { where(geek_id: geek_id) }
  scope :read, -> { where(read: true) }
  scope :unread, -> { where(read: false) }
  scope :invited, -> { where(invited: true) }
  scope :denied, -> { where(invited: false) }

end

# //mongoimport --db mgeeksongo_hirer_dev --collection jobs --file jobs_seed.json
# ///home/flyingminer/RubymineProjects/Sinatra/api_hirer/seeds/jobs_seed.json
