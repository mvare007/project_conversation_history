class ProjectsController < ApplicationController
	before_action :set_project, only: %i[update destroy conversation_history]

	def index
		projects = Project.includes(:comments, :status_transitions)
		@projects = Rails.cache.fetch(projects.cache_key) { projects }
	end

	def update
		if @project.update(project_params)
			redirect_to conversation_history_project_path(@project), notice: 'Updated successfully!'
		else
			flash.now[:alert] = "The project wasn't updated due to the following errors:\n#{@project.errors.full_messages.join("\n")}"
			render :conversation_history, status: :unprocessable_entity
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path, notice: 'Deleted Project!'
	end

	def conversation_history
		@comments = @project.comments.order(created_at: :desc)
	end

	def comments_field
    render layout: false
  end

	private

	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(
			:status,
			comments_attributes: %i[id author content project_id]
		)
	end
end
