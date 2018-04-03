class CommentsController < ApplicationController
  before_action :set_entry
    before_action :set_entry_comment, only: [:show, :update, :destroy]

    # GET /entries/:entry_id/comments
    def index
      json_response(@entry.comments)
    end

    # GET /entries/:entry_id/comments/:id
    def show
      json_response(@comment)
    end

    # POST /entries/:entry_id/comments
    def create
      @entry.comments.create!(comment_params)
      json_response(@entry, :created)
    end

    # PUT /entries/:entry_id/comments/:id
    def update
      @comment.update(comment_params)
      head :no_content
    end

    # DELETE /entries/:entry_id/comments/:id
    def destroy
      @comment.destroy
      head :no_content
    end

    private

    def comment_params
      params.permit(:author, :comment)
    end

    def set_entry
      @entry = Entry.find(params[:entry_id])
    end

    def set_entry_comment
      @comment = @entry.comments.find_by!(id: params[:id]) if @entry
    end
  end
