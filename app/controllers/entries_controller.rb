# frozen_string_literal: true
# :nodoc:
class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @journal = Journal.find_by_user(params[:journal_id], current_user)
    @entry = Entry.new_for_journal @journal, current_user
  end

  # GET /entries/1/edit
  def edit
    @journal = @entry.journal
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html do
          redirect_to [@entry.journal, @entry],
                      notice: 'Entry was successfully created.'
        end
        format.json { render :show, status: :created, location: [@entry.journal, @entry] }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html do
          redirect_to [@entry.journal, @entry],
                      notice: 'Entry was successfully updated.'
        end
        format.json { render :show, status: :ok, location: [@entry.journal, @entry] }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html do
        redirect_to journal_entries_path(@entry.journal),
                    notice: 'Entry was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find_by_user(params[:id], params[:journal_id], current_user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def entry_params
    params.require(:entry).permit(:user_id, :journal_id, :favorite,
                                  :title, :body, :accomplishment)
  end
end
