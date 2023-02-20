using FlutterUnityIntegration;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.UI;

public class Screenshot : MonoBehaviour
{
    public GameObject SafeArea;
    public GameObject CamButton;
    public UnityMessageManager flutterManager;

    // Start is called before the first frame update
    void Start()
    {
        flutterManager = gameObject.GetComponent<UnityMessageManager>();
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void captureImage()
    {
        SafeArea.gameObject.SetActive(false);
        CamButton.GetComponent<Image>().enabled = false;
        CamButton.GetComponent<Button>().interactable = false;

        StartCoroutine(CaptureScreen());
    }

    private IEnumerator CaptureScreen()
    {

        yield return new WaitForEndOfFrame();

        string timeStamp = System.DateTime.Now.ToString("dd-MM-yyyy-HH-mm-ss");
        Texture2D ss = new Texture2D(Screen.width, Screen.height, TextureFormat.RGB24, false);
        ss.ReadPixels(new Rect(0, 0, Screen.width, Screen.height), 0, 0);
        ss.Apply();
        string filePath = Path.Combine(GetAndroidExternalStoragePath(), "GeoTagAR-" + timeStamp + ".png");
        File.WriteAllBytes(filePath, ss.EncodeToPNG());

        Destroy(ss);

        RefreshGallary(filePath);

        CamButton.GetComponent<Image>().enabled = true;
        CamButton.GetComponent<Button>().interactable = true;
        SafeArea.gameObject.SetActive(true);
    }

    private string GetAndroidExternalStoragePath()
    {
        if (Application.platform != RuntimePlatform.Android)
            return Application.persistentDataPath;

        var jc = new AndroidJavaClass("android.os.Environment");
        var path = jc.CallStatic<AndroidJavaObject>("getExternalStoragePublicDirectory",
            jc.GetStatic<string>("DIRECTORY_DCIM"))
            .Call<string>("getAbsolutePath");
        return path;
    }

    private void RefreshGallary(String path)
    {
        using (AndroidJavaClass jcUnityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
        using (AndroidJavaObject joActivity = jcUnityPlayer.GetStatic<AndroidJavaObject>("currentActivity"))
        using (AndroidJavaObject joContext = joActivity.Call<AndroidJavaObject>("getApplicationContext"))
        using (AndroidJavaClass jcMediaScannerConnection = new AndroidJavaClass("android.media.MediaScannerConnection"))
        {
            jcMediaScannerConnection.CallStatic("scanFile", joContext, new string[] { path }, null, null);
        }
    }
}
