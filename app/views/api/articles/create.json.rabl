object @form => :data
attributes :article
node(:errors) { @form.errors.full_messages }
