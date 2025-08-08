local function create_tcp()
  local sock = vim.uv.new_tcp()

  assert(sock ~= nil, 'Failed to create TCP socket')

  return sock
end

local function create_server(host, port, on_connect)
  local server = create_tcp()

  server:bind(host, port)
  server:listen(128, function(err)
    assert(not err, err)

    print(err)

    local sock = create_tcp()

    server:accept(sock)
    on_connect(sock)
  end)
  return server
end

local server = create_server('0.0.0.0', 0, function(sock)
  sock:read_start(function(err, chunk)
    assert(not err, err) -- Check for errors.
    if chunk then
      sock:write(chunk) -- Echo received messages to the channel.
    else -- EOF (stream closed).
      sock:close() -- Always close handles to avoid leaks.
    end
  end)
end)

print('TCP echo-server listening on port: ' .. server:getsockname().port)
