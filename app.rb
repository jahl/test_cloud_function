require "functions_framework"

# Global variable, but scoped only within one function instance.
$count = 0

FunctionsFramework.http "execution_count" do |_request|
  $count += 1

  # NOTE: the total function invocation count across all instances
  # may not be equal to this value!
  "Instance execution count: #{$count}"
end
