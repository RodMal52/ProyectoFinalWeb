class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.candidate = Candidate.new
    respond_with self.resource
  end

  def create
    super
  end

  def update
    super
  end

 private

    def sign_up_params
      allow = [:email, [candidate_attributes: [:name, :last_name, :cellphone, :carreer1, :carreer2, :carreer3]], :password, :password_confirmation]
      params.require(resource_name).permit(allow)
    end



end 