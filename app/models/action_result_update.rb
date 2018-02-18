class ActionResultUpdate < StatusUpdate

  belongs_to :action_result, inverse_of: :action_result_updates


end