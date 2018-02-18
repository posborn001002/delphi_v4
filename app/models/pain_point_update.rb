class PainPointUpdate < StatusUpdate

  belongs_to :pain_point, inverse_of: :pain_point_updates

end