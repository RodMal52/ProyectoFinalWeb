class StudentMailer < ActionMailer::Base
    default from: "eventosteccem@gmail.com"

  def registration_email(account, create_table_candidate_event)
    @student = account
    @create_table_candidate_event = create_table_candidate_event
    @evento = @create_table_candidate_event.event
    attachments["#{@create_table_candidate_event.id}_qr.png"] = File.read("#{Rails.root}/app/assets/images/#{@create_table_candidate_event.id}_qr.png")
    mail(to: @student.email, subject: "Tu registro al evento #{@evento.name} ha sido exitoso")
  end 
end
