using System;
using System.Collections;
using System.Collections.Generic;
using FlutterUnityIntegration;
using UnityEngine;

public class MessageManager : MonoBehaviour
{
    UnityMessageManager flutterManager;
    // Start is called before the first frame update
    void Start()
    {
        flutterManager = gameObject.GetComponent<UnityMessageManager>();
    }

    // Update is called once per frame
    void Update()
    {
        flutterManager.SendMessageToFlutter("wasuuop");
    }

    void HandleWebFnCall(String action)
    {
        switch (action)
        {
            case "pause":
                Time.timeScale = 0;
                break;
            case "resume":
                Time.timeScale = 1;
                break;
            case "unload":
                Application.Unload();
                break;
            case "quit":
                Application.Quit();
                break;
        }
    }
}
