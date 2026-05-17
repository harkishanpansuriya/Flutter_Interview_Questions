## Async vs Isolate vs Compute – Flutter Concurrency Made Simple
- Async: Runs on the main thread using a non-blocking event loop. Best for lightweight tasks like API calls, database operations, and file I/O.
- Isolate: Runs on a completely separate thread with its own memory. Best for heavy CPU tasks like image processing or large JSON parsing. Enables true parallel execution without blocking UI.
- Compute: Compute is a helper function provided by Flutter to simplify using isolates. Instead of manually creating and managing an isolate, we just use compute, and it handles everything internally.

