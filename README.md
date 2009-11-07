# Host Router

## Usage

`map.connect '/some/path', :controller => 'somecontroller', :conditions => { :host => 'abc.example.com' }
map.connect '/some/path', :controller => 'othercontroller', :conditions => { :hosts => ['xyz.example.com', 'yyz.example.com'] }`

