class DeviseFailure < Devise::FailureApp
  def request_format
    if request.format == :zip
      Mime::Type.lookup_by_extension(:html).ref
    else
      super
    end
  end

end
