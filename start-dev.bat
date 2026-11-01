@echo off
echo === ThoughtBox - Local Development Startup ===
echo.

:: Start backend in a new window
echo Starting backend (FastAPI + SQLite) on http://localhost:8000 ...
start "ThoughtBox Backend" cmd /k "cd /d %~dp0backend && set DATABASE_URL=sqlite:///./thoughtbox.db && set MODERATOR_SECRET=dev-secret-123 && set CORS_ORIGINS=http://localhost:5173 && uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload"

:: Give backend a moment to start
timeout /t 3 /nobreak >nul

:: Start frontend in a new window
echo Starting frontend (Vite dev server) on http://localhost:5173 ...
start "ThoughtBox Frontend" cmd /k "cd /d %~dp0frontend && set VITE_API_URL=http://localhost:8000 && npm run dev"

echo.
echo === Both services started in separate windows ===
echo  Backend API:    http://localhost:8000
echo  Frontend App:   http://localhost:5173
echo  API Docs:       http://localhost:8000/docs
echo.
echo Admin login: admin / admin123
echo.
pause

