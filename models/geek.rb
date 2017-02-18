class Geek
  include Mongoid::Document

  field :name, type: String
  field :stack, type: String
  field :resume, type: Boolean, default: false

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :stack, presence: true
  validates :resume, presence: true

  index({ name: 'text' })
  # index({ isbn:1 }, { unique: true, name: "isbn_index" })

  scope :name, -> (name) { where(name: /^#{name}/i) } # where: include? string case insensative
  scope :stack, -> (stack) { where(stack: /#{stack}/i) } # where: include? string in any place case insensative
  scope :id, -> (id) { where(id: id) } # where: include? string in any place case insensative

  def self.geek_id(name)
    geek = name(name)
    geek.blank? ? [].to_json : geek[0].id
  end

  def self.geeks_applied(name)
    geeks_applied = Apply.all
    halt(404, { message:'Applications Not Found'}.to_json) unless geeks_applied # ?
    return geeks_applications(geeks_applied) if name.blank?
    name_filtering(geeks_applied, name)
  end

  def self.geeks_applied_read(name)
    geeks_applied = Apply.read
    return geeks_applications(geeks_applied) if name.blank?
    name_filtering(geeks_applied, name)
   end

  def self.geeks_applied_unread(name)
    geeks_applied = Apply.unread
    return geeks_applications(geeks_applied) if name.blank?
    name_filtering(geeks_applied, name)
  end

  def self.geeks_applied_invited(name)
    geeks_applied = Apply.invited
    return geeks_applications(geeks_applied) if name.blank?
    name_filtering(geeks_applied, name)
  end

  def self.geeks_applied_denied(name)
    geeks_applied = Apply.denied
    return geeks_applications(geeks_applied) if name.blank?
    name_filtering(geeks_applied, name)
  end

  def self.querying_by_name(query, name)
    query.apply_geek(geek_id(name))
  end

  def self.geeks_applications(geeks)
    geeks.blank? ? [].to_json : geeks.to_json
  end

  def self.name_filtering(query, name)
    query = querying_by_name(query, name) unless query.blank?
    geeks_applications(query)
  end
end
