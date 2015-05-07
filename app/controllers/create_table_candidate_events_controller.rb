class CreateTableCandidateEventsController < ApplicationController
  before_action :set_create_table_candidate_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_account!
  respond_to :html

  def index
    @create_table_candidate_events = CreateTableCandidateEvent.all
    respond_with(@create_table_candidate_events)
  end

  def show
    respond_with(@create_table_candidate_event)
  end

  def new
    @create_table_candidate_event = CreateTableCandidateEvent.new
    respond_with(@create_table_candidate_event)
  end

  def edit
    unless current_account.roles.first.nil?
      case current_account.roles.first.name #Checks the role of current user
        when 'admin'  #If the role is admin it sends them to users_path, which is the pseudo admin screen
          
        
        else #if there is no role, user is redirected to the root
          
          redirect_to authenticated_root_path
      end
    else
        redirect_to authenticated_root_path
    end
  end

  def create
    @account = current_account
    @create_table_candidate_event = CreateTableCandidateEvent.new(create_table_candidate_event_params)
    respond_to do |format|
      if @create_table_candidate_event.save
        qr = RQRCode::QRCode.new("http://eventostec-cem.herokuapp.com"+edit_create_table_candidate_event_path(@create_table_candidate_event), :size => 8, :level => :h )
        png = qr.to_img                                             # returns an instance of ChunkyPNG
        png.resize(90, 90).save("app/assets/images/#{@create_table_candidate_event.id}_qr.png")
        StudentMailer.registration_email(@account, @create_table_candidate_event).deliver
        format.html { redirect_to authenticated_root_path, notice: 'El registro ha sido realizado con éxito. Espera un correo con la confirmación y tu código de acceso.' }
        format.json { render :show, status: :created, location: @create_table_candidate_event}
      else
        format.html { render :new }
        format.json { render json: @create_table_candidate_event, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @create_table_candidate_event.update(create_table_candidate_event_params)
        format.html { redirect_to rails_admin_path, notice: 'La asistencia ha sido registrada.' }
        format.json { render :show, status: :ok, location: @create_table_candidate_event }
      else
        format.html { render :edit }
        format.json { render json: @create_table_candidate_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @create_table_candidate_event.destroy
    respond_with(@create_table_candidate_event)
  end

  private
    def set_create_table_candidate_event
      @create_table_candidate_event = CreateTableCandidateEvent.find(params[:id])
    end

    def create_table_candidate_event_params
      params.require(:create_table_candidate_event).permit(:candidate_id, :event_id, :assistance)
    end
end
