module AttrSlug
  module Version
    Major       = 1
    Minor       = 0
    Revision    = 0
    Prerelease  = nil
    Compact     = [Major, Minor, Revision, Prerelease].compact.join('.')
    Summary     = "AttrSlug v#{Compact}"
    Description = "An ActiveRecord concern to automatically generate slug fields."
    Author      = "Jurgen Jocubeit"
    Email       = "support@brightcommerce.com"
    Homepage    = "https://github.com/brightcommerce/attr_slug"
    Metadata    = {'copyright' => 'Copyright 2018 Brightcommerce, Inc. All Rights Reserved.'}
    License     = "MIT"
  end
end
