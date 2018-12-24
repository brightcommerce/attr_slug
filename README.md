# AttrSlug

AttrSlug is an ActiveRecord concern that automatically generates slug fields using array of attributes.

## Installation

To install add the line to your `Gemfile`:

``` ruby
gem 'attr_slug'
```

And run `bundle install`.

## Usage

AttrSlug expects a `slug` column to exist on the model. It is good practice to add an unique index on the column.

``` ruby
# db/migrations/20180101000000_create_posts.rb
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |table|
      table.column :content, :text
      table.column :slug, :string, null: false, index: {unique: true)
      table.column :title, :string, null: false
    end
  end
end
```

You then include the AttrSlug module in your model class and use the `attr_slug` macro to set your fields you wish to use to derive it's slug.

``` ruby
# app/models/post.rb
class Post < ActiveRecord::Base
  include AttrSlug

  attr_slug :title, :id

  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true
end
```

Using the examples above, creating a Post instance will automatically generate the slug field:

``` ruby
post = Post.create title: "Test Post"
post.slug # "test-post-1234"
```

AttrSlug doesn't modify any ActiveRecord finders. To automatically use the slug in URLs override the model's `to_param` method:

``` ruby
# app/models/post.rb
class Post < ActiveRecord::Base
  ...

  def to_param # overridden
    slug
  end
end
```

You should then use the following to retrieve your models in the controller:

```ruby
def show
  @post = Post.find_by(slug: params[:id])
end
```

To autoload AttrSlug for all models, add the following to an initializer:

``` ruby
require 'attr_slug/active_record'
```

You then don't need to `include AttrSlug` in any model.

## Dependencies

AttrSlug gem has the following runtime dependencies:
- activerecord >= 5.1.4
- activesupport >= 5.1.4

## Compatibility

Tested with MRI 2.4.2 against Rails 5.2.2.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credit

This gem was written and is maintained by [Jurgen Jocubeit](https://github.com/JurgenJocubeit), CEO and President Brightcommerce, Inc.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Copyright

Copyright 2018 Brightcommerce, Inc.
