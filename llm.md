# PStore Logger Usage Guide

The PStore Logger is a simple Ruby gem that provides an easy way to log data (like webhooks or API responses) to files using Ruby's PStore for later inspection.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pstore_logger'
```

And then execute:
```bash
bundle install
```

Or install it yourself as:
```bash
gem install pstore_logger
```

## Basic Usage

### Requiring the Gem

```ruby
require 'pstore/logger'
```

### Setting up the Logger

```ruby
# Initialize with a storage path and tag
pstore_logger = PStoreLogger.new(storage_path: '/path/to/my-folder', tag: 'Customer')
```

### Saving Data

#### Save with automatic timestamp filename

```ruby
Customer = Data.define(:id, :name, :email)

customer = Customer.new(id: 1, name: 'John Doe', email: 'john@example.com')

# Saves to: /path/to/my-folder/customer/2025-06-07-09-26-00.pstore
pstore_logger.save(customer)
```

#### Save with custom file ID

```ruby
# Saves to: /path/to/my-folder/customer/1.pstore
pstore_logger.save(customer, file_id: customer.id)

# If file already exists, appends number: 1_1.pstore, 1_2.pstore, etc.
pstore_logger.save(customer, file_id: customer.id)
```

#### Handling nil file_id

```ruby
# When file_id is nil, defaults to timestamp-based filename
pstore_logger.save(customer, file_id: nil)
```

### Loading Data

#### Load the most recent entry

```ruby
# Loads the last saved file from the folder
customer = pstore_logger.load_last
```

## File Organization

The gem organizes files in the following structure:
```
/path/to/my-folder/
├── customer/
│   ├── 2025-06-07-09-26-00.pstore
│   ├── 1.pstore
│   └── 1_1.pstore
└── other_tag/
    └── ...
```

## Use Cases

- **Webhook Logging**: Save incoming webhook payloads for debugging
- **API Response Caching**: Store API responses for offline analysis
- **Data Auditing**: Keep records of data changes over time
- **Development Testing**: Save test data for repeated use

## Example: Webhook Logger

```ruby
require 'pstore/logger'

webhook_logger = PStoreLogger.new(
  storage_path: './logs/webhooks', 
  tag: 'stripe'
)

# In your webhook handler
def handle_stripe_webhook(payload)
  webhook_logger.save(payload)
  # Process webhook...
end

# Later, inspect the last webhook
last_webhook = webhook_logger.load_last
puts last_webhook
```