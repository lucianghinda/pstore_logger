# Changelog

## [0.1.0] - 2025-06-19

### Added

- Initial release of PStoreLogger gem
- Core PStoreLogger class for logging data to PStore files
- Automatic timestamp-based filename generation (YYYY-MM-DD-HH-MM-SS format)
- Custom file_id support for organized file naming
- Automatic conflict resolution with numbered suffixes (e.g., `file_1.pstore`, `file_2.pstore`)
- `save(data, file_id: nil)` method for storing data
- `load_last` method for retrieving the most recently saved entry

### Features

- **Automatic Directory Creation**: Creates nested directories based on storage path and tag
- **Collision Handling**: Handles both timestamp and file_id collisions gracefully
- **Flexible Data Storage**: Stores any Ruby object that can be serialized by PStore
- **Timestamp Tracking**: Automatically stores creation timestamp with each entry
- **Simple API**: Clean, intuitive interface for saving and loading data
