class SubmissionsController < ApplicationController
    def new
        @submission = Submission.new
    end
end
