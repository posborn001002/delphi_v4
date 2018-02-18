class CommentsController < ApplicationController

    before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
    before_action :set_edit_parent_from_url, only: [:new,  :edit]
    before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
    before_action :initialize_new_resource, only: [:new]
    before_action :create_new_resource, only: [:create]
    before_action :initialize_resource_collection, only: [:index]

    # GET /comments
    # GET /comments.json
    def index
    end

    # GET /comments/1
    # GET /comments/1.json
    def show
    end

    # GET /comments/new
    def new
    end

    # GET /comments/1/edit
    def edit
    end

    # POST /comments
    # POST /comments.json
    def create
      respond_to do |format|
        if @resource.save
          format.html { redirect_to workshop_path( @parent ), notice: 'Comment successfully created.' }
          format.json { render :show, status: :created, location: @resource }
        else
          format.html { render :new, notice: 'An error occured!'  }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /comments/1
    # PATCH/PUT /comments/1.json
    def update
      respond_to do |format|
        if @resource.update( comment_params )
          format.html { redirect_to @resource, notice: 'Comment successfully updated.' }
          format.json { render :show, status: :ok, location: @resource }
        else
          format.html { render :edit }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /comments/1
    # DELETE /comments/1.json
    def destroy
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    def set_parent_from_url
      @parent = StatusUpdate.find( params[:workshop_id] || params[:workshop][:id] )
    end
    def set_edit_parent_from_url
      @edit_parent = StatusUpdate.find( params[:workshop_id] )
    end
    def initialize_resource
      @resource = Comment.find( params[:id] )
    end
    def initialize_new_resource
      @resource = @parent.comments.new
    end
    def initialize_resource_collection
      @resources = @parent.comments.all.order( :name )
      @comments = @resources
    end
    def create_new_resource
      @resource = @parent.comments.new( comment_params )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(
          :status_update_id,
          :comment_id,
          :person_id,
          :comment,
          :active
      )
    end


end