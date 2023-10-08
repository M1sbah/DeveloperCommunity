class WorkExperiencesController < ApplicationController
    before_action :set_work_experience, only: %i[edit update destroy]
    
    def new
        @work_experience = current_user.work_experiences.new
    end

    def edit
    end

    def create
        @work_experience = current_user.work_experiences.new(work_experience_params)
        # respond_to do |format|
			if @work_experience.save
                render_turbo_stream('append', 'work_experience_items','work_experiences/work_experience',{work_experience: @work_experience})
				# format.turbo_stream {render turbo_stream: turbo_stream.append('work_experience_items', partial: 'work_experiences/work_experience', locals: {work_experience: @work_experience})}
            else
                render_turbo_stream('replace','remote_modal','shared/turbo_modal', {form_partial: 'work_experiences/form', modal_title: 'Add new work experience' })
                # format.turbo_stream { render turbo_stream: turbo_stream.replace('remote_modal', partial: 'shared/turbo_modal', locals: {form_partial: 'work_experiences/form', modal_title: 'Add new work experience' }) }
            end
		# end
    end

    def update
        # respond_to do |format|
			if @work_experience.update(work_experience_params)
                render_turbo_stream('replace',"work_experience_item_#{@work_experience.id}",'work_experiences/work_experience', {work_experience: @work_experience})
				# format.turbo_stream {render turbo_stream: turbo_stream.replace("work_experience_item_#{@work_experience.id}", partial: 'work_experiences/work_experience', locals: {work_experience: @work_experience})}
            else
                render_turbo_stream('replace','remote_modal','shared/turbo_modal',{form_partial: 'work_experiences/form', modal_title: 'Edit work experience' })
                # format.turbo_stream { render turbo_stream: turbo_stream.replace('remote_modal', partial: 'shared/turbo_modal', locals: {form_partial: 'work_experiences/form', modal_title: 'Edit work experience' }) }
            end
		# end
    end

    def destroy
        # respond_to do |format|
            @work_experience.destroy
            render_turbo_stream('remove',"work_experience_item_#{@work_experience.id}")
            # format.turbo_stream {render turbo_stream: turbo_stream.remove("work_experience_item_#{@work_experience.id}")}
        # end
    end
    
    private

    def set_work_experience
        @work_experience = current_user.work_experiences.find(params[:id])
    end

    def work_experience_params
        params.require(:work_experience).permit(:start_date, :end_date, :currently_working_here, :company, :employment_type, :location, :location_type, :description, :user_id, :job_title)
    end
end