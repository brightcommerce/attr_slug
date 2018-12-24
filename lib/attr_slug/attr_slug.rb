require 'active_support/concern'

module AttrSlug
  extend ActiveSupport::Concern

  included do
    validates :slug, presence: true, uniqueness: true, format: /\A[a-z0-9\-_]+\z/

    before_validation :derive_slug
  end

  class_methods do
    def attr_slug(*attrs)
      class_attribute :slug_parts
      self.slug_parts = attrs || [title]
    end
  end

  def derive_slug
    return true if slug.present?

    parts = Array self.slug_parts
    derived_slug = parts.shift.to_s.parameterize
    next_number = 2

    while self.class.where(slug: derived_slug).any?
      if next_part = parts.shift
        derived_slug += "-" + next_part.to_s.parameterize
      else
        derived_slug += "-#{next_number}"
        next_number += 1
      end
    end

    self.slug = derived_slug
  end
end
