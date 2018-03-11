object @form => :data
attributes :topic
node(:errors) { @form.errors.full_messages }
