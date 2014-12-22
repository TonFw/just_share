module Helpers
  # Check if it is an accessible URL
  def accessible? url
    resp = RestClient.get url
    resp.code == 200 ? true : false
  end

  # Return it current test name, receiving:
  # context: (self from the RSpec)
  # the_first: get based only on the first name on the test name
  def get_current_test_name context, counter, the_first=true
    current_spec = context.class.descendants.first
    tests = current_spec.examples
    test_name = tests[counter].metadata[:description]
    test_name = test_name.split(' ').first if the_first

    # return it name
    test_name
  end
end