class Job
  include Mongoid::Document

  field :place, type: String  # Remote, Contract, Permanent
  field :company_id, type: Object
  field :name, type: String
  field :description, type: String

  validates :place, presence: true
  validates :company_id, presence: true
  validates :name, presence: true

  # embedded_in :company

  index({ company_id: 1 })
  # index({ isbn:1 }, { unique: true, name: "isbn_index" })

  scope :place, -> (place) { where(place: /^#{place}/i) }
  scope :name, -> (name) { where(name: /^#{name}/i) }
  # scope :company_id, -> (company_id) { where(company_id: company_id) }

  def self.company_jobs(company_id)
    where(company_id: company_id)
  end



end
