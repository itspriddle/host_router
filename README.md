# Host Router

Create routes based on HTTP_HOST.

## Usage

	map.connect '/some/path', :controller => 'somecontroller',  :conditions => { :host => 'abc.example.com' }
	map.connect '/some/path', :controller => 'othercontroller', :conditions => { :hosts => ['xyz.example.com', 'yyz.example.com'] }

## Notes

Put lib/host_router.rb in config/initializers if your Rails version supports initializers.
