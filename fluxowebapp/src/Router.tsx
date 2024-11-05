import { createBrowserRouter } from "react-router-dom";

import { Applayout } from "./components/layouts/AppLayout";

import NoMatch from "./pages/NoMatch";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Transactions from "./pages/Transactions";
import Dashboard from "./pages/Dashboard";
import Register from "./pages/Register";

export const router = createBrowserRouter([
    {
        path: "/",
        element: <Applayout />,
        children: [
            {
                path: "",
                element: <Home />,
            },
            {
                path: "Login",
                element: <Login />,
            },
            {
                path: "Transactions",
                element: <Transactions />,
            },
            {
                path: "Dashboard",
                element: <Dashboard />,
            },
            {
                path: "Register",
                element: <Register />,
            },
        ],
    },
    {
        path: "*",
        element: <NoMatch />,
    },
], {
    basename: global.basename
})
