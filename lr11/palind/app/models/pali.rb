class Pali < ApplicationRecord
  validates :key, :palinds, :unequality, presence: true

  def unequality
    !Pali.find_by_key key
  end

  def self.get_palinds_by_key(key)
    palinds_record = find_by_key(key)
    if palinds_record then JSON.parse(palinds_record.palinds)['palinds']['value'] end
  end

  def self.all_palinds_hash_array
    all.map { |x| { id: x.id, key: x.key, palinds: x.palinds } }
  end
end
