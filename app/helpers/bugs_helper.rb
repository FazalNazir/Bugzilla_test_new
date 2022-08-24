module BugsHelper
    def options_for_bug_status
        [
            ["New", 'New'],
            ["Started", 'Started'],
            ["Resolved", 'Resolved']
            ]
    end
    def options_for_feature_status
        [
            ["New", 'New'],
            ["Started", 'Started'],
            ["Completed", 'Completed']
            ]
    end
    def options_for_type
        [["Feature", 'Feature'],
         ["Bug", 'Bug']]
    end
end
