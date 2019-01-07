module Api
  module Line
    module Events
      module Messages
        module Templates
          class ButtonTemplate
            def initialize(task)
              @task = task
            end

            def execute
              {
                "type": "template",
                "altText": "this is a buttons template",
                "template": {
                  "type": "buttons",
                  "actions": [
                    {
                      "type": "uri",
                      "label": "タスクを終了する",
                      "uri": Constants::URL + "/api/tasks/finish?is_done=finish&user_id=#{@task.user_id}&task_id=#{@task.id}"
                    }
                  ],
                  "thumbnailImageUrl": "https://cdn.pixabay.com/photo/2015/06/24/16/36/office-820390_960_720.jpg",
                  "title": @task.value,
                  "text": "リマインダーを作成しました。"
                }
              }
            end

            def remind
              {
                "type": "template",
                "altText": "this is a buttons template",
                "template": {
                  "type": "buttons",
                  "actions": [
                    {
                      "type": "uri",
                      "label": "タスクを終了する",
                      "uri": Constants::URL + "/api/tasks/finish?is_done=finish&user_id=#{@task.user_id}&task_id=#{@task.id}"
                    }
                  ],
                  "thumbnailImageUrl": "https://cdn.pixabay.com/photo/2015/06/24/16/36/office-820390_960_720.jpg",
                  "title": @task.value,
                  "text": "リマインダーとしてのお知らせです。"
                }
              }
            end
          end
        end
      end
    end
  end
end
