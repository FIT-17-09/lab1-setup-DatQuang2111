$ErrorActionPreference = "Continue"
New-Item -ItemType Directory -Force -Path "evidence/buoi-01" | Out-Null

function Get-PythonVersion {
    try { $result = & python --version 2>$null; if ($LASTEXITCODE -eq 0) { return $result } } catch {}
    try { $result = & python3 --version 2>$null; if ($LASTEXITCODE -eq 0) { return $result } } catch {}
    try { $result = & py -3 --version 2>$null; if ($LASTEXITCODE -eq 0) { return $result } } catch {}
    "python not found"
}

function Get-PipVersion {
    try { $result = & pip --version 2>$null; if ($LASTEXITCODE -eq 0) { return $result } } catch {}
    try { $result = & pip3 --version 2>$null; if ($LASTEXITCODE -eq 0) { return $result } } catch {}
    try { $result = & python -m pip --version 2>$null; if ($LASTEXITCODE -eq 0) { return $result } } catch {}
    try { $result = & python3 -m pip --version 2>$null; if ($LASTEXITCODE -eq 0) { return $result } } catch {}
    try { $result = & py -3 -m pip --version 2>$null; if ($LASTEXITCODE -eq 0) { return $result } } catch {}
    "pip not found"
}

$toolFile = "evidence/buoi-01/tool-versions.txt"
"# Tool versions" | Out-File $toolFile -Encoding utf8
Get-Date | Out-File $toolFile -Append -Encoding utf8
git --version 2>&1 | Out-File $toolFile -Append -Encoding utf8
docker --version 2>&1 | Out-File $toolFile -Append -Encoding utf8
docker compose version 2>&1 | Out-File $toolFile -Append -Encoding utf8
node --version 2>&1 | Out-File $toolFile -Append -Encoding utf8
npm --version 2>&1 | Out-File $toolFile -Append -Encoding utf8
Get-PythonVersion | Out-File $toolFile -Append -Encoding utf8
Get-PipVersion | Out-File $toolFile -Append -Encoding utf8

docker --version 2>&1 | Out-File "evidence/buoi-01/docker-version.txt" -Encoding utf8
docker compose version 2>&1 | Out-File "evidence/buoi-01/compose-version.txt" -Encoding utf8
docker run --rm hello-world 2>&1 | Out-File "evidence/buoi-01/hello-world.txt" -Encoding utf8
docker image ls --format "table {{.Repository}}:{{.Tag}}`t{{.ID}}`t{{.Size}}" 2>&1 | Out-File "evidence/buoi-01/image-list.txt" -Encoding utf8
git log --oneline -5 2>&1 | Out-File "evidence/buoi-01/git-log.txt" -Encoding utf8

& ".\scripts\smoke_test.ps1"

Write-Host "Evidence collected in evidence/buoi-01"
