  class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @emails = Email.approved
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @email = current_user.emails.build
  end

  def edit
  end

  def create
    @email = current_user.emails.build(email_params)
      if @email.save
         redirect_to @email
         flash[:success] = "Your email has been created and is pending approval. Thank you."
      else
        render "new"
      end
  end

  def update
      if @email.update(email_params)
        redirect_to @email
        flash[:success] = "Your email has been updated."
      else
        render "edit"
      end
  end

  def destroy
    @email.destroy
    if current_user.admin?
      flash[:success] = "Admin has deleted email successfully"
      redirect_to @email
    else current_user == @email.user
      flash[:success] = "Your Email has been deleted"
      redirect_to @email
    end
  end

  private

    def set_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:name, :starts_at, :qty, :pre, :email_pending, :email_sent)
    end

end










