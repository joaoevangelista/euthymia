# frozen_string_literal: true
# :nodoc:
class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /journals
  # GET /journals.json
  def index
    authorize Journal
    @journals = Journal.all_by_user current_user
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    authorize @journal
    @avg_emotions = @journal.avg_emotions
  end

  # GET /journals/new
  def new
    authorize Journal
    @journal = Journal.new_for_user current_user
  end

  # GET /journals/1/edit
  def edit
    authorize @journal
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params)
    authorize @journal
    respond_to do |format|
      if @journal.save
        format.html do
          redirect_to @journal,
                      notice: 'Journal was successfully created.'
        end
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    authorize @journal
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: 'Journal was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html do
        redirect_to journals_url,
                    notice: 'Journal was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_journal
    @journal = Journal.find_by_user(params[:id], current_user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def journal_params
    params.require(:journal).permit(:title, :user_id)
  end
end
