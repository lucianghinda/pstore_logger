## The PStore Logger

The PStore Logger is a simple logging Ruby gem that uses the PStore to store data.

The main purpose is to provide a simple way to log webhooks or API responses to a file for further inspection.

## Coding Guidelines

- The project uses Ruby 3.4.4 and should be compatible with Ruby 4
- The project uses Rubocop for linting
- The project uses Minitest for testing
- The code should be simple and easy to understand, with a focus on readability and maintainability
- Simplicity is the main key, and the code should be as simple as possible

## Interface/Developer Experience

Here is how I see this used:

### Using it with a folder and writing data

```ruby

Customer = Data.define(:id, :name, :email)

pstore_logger = PStoreLogger.new(storage_path: '/path/to/my-folder', tag: 'Customer')


customer = Customer.new(id: 1, name: 'John Doe', email: 'john@example.com')
pstore_logger.save(customer) # => should save this to /path/to/my-folder/customer/2025-06-07-09-26-00.pstore" - notice it creates a file with the current timestamp

pstore_logger.save(customer, file_id: customer&.id) # => should save this to /path/to/my-folder/customer/1.pstore" in case of conflict with the existing files will append a number to the file name => 1_1.pstore if 1.pstore already exists. If file_id is nil, default to timestamp
```

### Using it with a folder and reading data

```ruby

pstore_logger = PStoreLogger.new(storage_path: '/path/to/my-folder', tag: 'Customer')

customer = pstore_logger.load_last # => should load the last file from the folder
```
