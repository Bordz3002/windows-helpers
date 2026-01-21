class NetworkInfo {

    [void] GetAdapters() {
        Get-NetAdapter | ForEach-Object {
            Write-Host "Name: $($_.Name), Status: $($_.Status), MAC: $($_.MacAddress), Speed: $($_.LinkSpeed)"
        }
    }

    [void] GetIPAddresses() {
        Get-NetIPAddress | ForEach-Object {
            Write-Host "Adapter: $($_.InterfaceAlias), IP: $($_.IPAddress), Type: $($_.AddressFamily)"
        }
    }

    [void] GetDNSServers() {
        Get-DnsClientServerAddress | ForEach-Object {
            Write-Host "Adapter: $($_.InterfaceAlias), DNS: $($_.ServerAddresses -join ', ')"
        }
    }

    [void] GetGateways() {
        Get-NetRoute -DestinationPrefix "0.0.0.0/0" | ForEach-Object {
            Write-Host "Adapter: $($_.InterfaceAlias), Gateway: $($_.NextHop)"
        }
    }
}
$net = [NetworkInfo]::new()
$net.GetAdapters()
$net.GetIPAddresses()
$net.GetDNSServers()
$net.GetGateways()
