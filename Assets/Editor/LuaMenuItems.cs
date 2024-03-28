/*

    Copyright (c) 2024 Pocketz World. All rights reserved.

    This is a generated file, do not edit!

    Generated by com.pz.studio
*/

using System;
using System.Linq;
using UnityEngine;
using UnityEditor;

namespace Highrise.Studio.Generated
{
    internal static class LuaMenuItems
    {
        private static Type s_luaScriptType;
        private static Type s_luaBehaviourType;

        private static void LoadScriptType()
        {
            var assembly = AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault(a => a.GetName().Name == "com.pz.highrise.lua");
            if (assembly == null)
                return;

            s_luaScriptType = assembly.GetTypes().FirstOrDefault(t => t.Name == "LuaScript");
            if (s_luaScriptType == null)
                return;

            assembly = AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault(a => a.GetName().Name == "com.pz.highrise.game.client");
            if (assembly == null)
                return;

            s_luaBehaviourType = assembly.GetTypes().FirstOrDefault(t => t.Name == "LuaBehaviour");
            if (s_luaBehaviourType == null)
                return;
        }

        private static void AddScript(string path)
        {
            var gameObjects = Selection.gameObjects;
            if (gameObjects.Length == 0)
                return;

            if (s_luaScriptType == null)
                LoadScriptType();

            if (s_luaScriptType == null || s_luaBehaviourType == null)
                return;

            var asset = AssetDatabase.LoadAssetAtPath(path, s_luaScriptType);
            if (asset == null)
                return;

            AddScript(gameObjects, asset);
        }

        private static void AddScript(GameObject[] parents, UnityEngine.Object script)
        {
            Undo.SetCurrentGroupName("Add Lua");

            foreach(var parent in parents)
            {
                var so = new SerializedObject(Undo.AddComponent(parent, s_luaBehaviourType));
                so.FindProperty("_script").objectReferenceValue = script;
                so.ApplyModifiedProperties();
            }

            Undo.RecordObjects(parents, "Add Lua");
        }

        [MenuItem("Component/Lua/Billboard Script")]
        private static void AddComponent1() => AddScript("Assets/Scripts/BillboardScript.lua");
        [MenuItem("Component/Lua/Bob Script")]
        private static void AddComponent2() => AddScript("Assets/Scripts/BobScript.lua");
        [MenuItem("Component/Lua/Fountain Script")]
        private static void AddComponent3() => AddScript("Assets/Scripts/FountainScript.lua");
        [MenuItem("Component/Lua/Hide On Tap")]
        private static void AddComponent4() => AddScript("Assets/Scripts/HideOnTap.lua");
        [MenuItem("Component/Lua/Ingredient Point Script")]
        private static void AddComponent5() => AddScript("Assets/Scripts/IngredientPointScript.lua");
        [MenuItem("Component/Lua/Ingredient Script")]
        private static void AddComponent6() => AddScript("Assets/Scripts/IngredientScript.lua");
        [MenuItem("Component/Lua/Ingredient UI Script")]
        private static void AddComponent7() => AddScript("Assets/Scripts/IngredientUIScript.lua");
        [MenuItem("Component/Lua/Inventory Attach Script")]
        private static void AddComponent8() => AddScript("Assets/Scripts/InventoryAttachScript.lua");
        [MenuItem("Component/Lua/Networked Chair")]
        private static void AddComponent9() => AddScript("Assets/Scripts/NetworkedChair.lua");
        [MenuItem("Component/Lua/Player Inventory Script")]
        private static void AddComponent10() => AddScript("Assets/Scripts/PlayerInventoryScript.lua");
        [MenuItem("Component/Lua/Recipe Script")]
        private static void AddComponent11() => AddScript("Assets/Scripts/RecipeScript.lua");
        [MenuItem("Component/Lua/Recipe Station Script")]
        private static void AddComponent12() => AddScript("Assets/Scripts/RecipeStationScript.lua");
        [MenuItem("Component/Lua/Recipe Turn In Script")]
        private static void AddComponent13() => AddScript("Assets/Scripts/RecipeTurnInScript.lua");
        [MenuItem("Component/Lua/Recipe UI Script")]
        private static void AddComponent14() => AddScript("Assets/Scripts/RecipeUIScript.lua");
        [MenuItem("Component/Lua/Anchor")]
        private static void AddComponent15() => AddScript("Packages/com.pz.studio/Runtime/Lua/Anchor.lua");
        [MenuItem("Component/Lua/General Chat")]
        private static void AddComponent16() => AddScript("Packages/com.pz.studio/Runtime/Lua/GeneralChat.lua");
        [MenuItem("Component/Lua/Highrise Camera Controller")]
        private static void AddComponent17() => AddScript("Packages/com.pz.studio/Runtime/Lua/HighriseCameraController.lua");
        [MenuItem("Component/Lua/RTS Camera")]
        private static void AddComponent18() => AddScript("Packages/com.pz.studio/Runtime/Lua/RTSCamera.lua");
        [MenuItem("Component/Lua/Scene Loader")]
        private static void AddComponent19() => AddScript("Packages/com.pz.studio/Runtime/Lua/SceneLoader.lua");

    }
}

