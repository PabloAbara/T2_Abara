class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

    # GET /entries
    def index
      @entries = Entry.all
      json_response(@entries)
    end

    # POST /entries
    def create
      @entry = Entry.create!(entry_params)
      json_response(@entry, :created)
    end

    # GET /entries/:id
    def show
      json_response(@entry)
    end

    # PUT /entries/:id
    def update
      @entry.update(entry_params)
      head :no_content
    end

    # DELETE /entries/:id
    def destroy
      @entry.destroy
      head :no_content
    end

    private

    def entry_params
      # whitelist params
      params.permit(:title, :body, :subtitle)
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end
  end
