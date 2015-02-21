class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @emails = Email.all
    respond_with(@emails)
  end

  def show
    respond_with(@email)
  end

  def new
    @email = current_user.emails.build
    respond_with(@email)
  end

  def edit
  end

  def create
    @email = current_user.emails.build(email_params)
    @email.save
    respond_with(@email)
  end

  def update
    @email.update(email_params)
    respond_with(@email)
  end

  def destroy
    @email.destroy
    respond_with(@email)
  end

  private
    def set_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:name, :starts_at, :qty, :pre)
    end
end
